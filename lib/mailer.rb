require 'mail'
require "configurations"
require "email_template"
require "yaml"

class Mailer
  def initialize
    @smtp_settings = get_email_setting
  end

  def get_email_setting
    {:address               => "smtp.gmail.com",
      :domain               => "example.com",
      :authentication       => "plain",
      :user_name            => CONFIG["email_username"],
      :password             => CONFIG["email_password"],
      :port                 => 587,
      :enable_starttls_auto => true}
  end

  def fire
    set_delivery_method(@smtp_settings)
    mail = initialize_mail
    mail.deliver
  end

  def set_delivery_method(options)
    Mail.defaults do
      delivery_method :smtp, options
    end
  end

  def initialize_mail
    Mail.new do
      from "Jyaasa <" + CONFIG["email_username"] + ">"
      to YAML.load_file("./config/receipent.yml")["receipent"].map{|k,v| v}.join(",")
      subject "Jyaasa Monthly Newsletter"
      html_part do
        content_type 'text/html; charset=UTF-8'
        body EmailTemplate.new.get_email_contents(Date.today.strftime("%B"))
      end
    end      
  end
end
