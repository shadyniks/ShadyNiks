module Shadyniks
  class App < Padrino::Application
    register SassInitializer
    use ConnectionPoolManagement
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    get "/" do
      redirect "/blog"
    end

    get :about, :map => '/about_us' do
      render :haml, "%p This is a sample blog created to demonstrate how Padrino works!"
    end
  end
end
