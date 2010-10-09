class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_digest(list)
    @id_list = list
    # puts @id_list.inspect
    mail :to => "twiga.jon+sc@gmail.com", :subject => "Digest test"
    puts "Sent"
  end
end
