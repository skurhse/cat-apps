module Cat
  class App < Grape::API
    format :txt

    get :hello do
      "%s World!\n" % (params[:name] ? params[:name].capitalize : 'Meow')
    end

    get :goodbye do
      "RARARARAAAAAAAAA\n"
    end
  end
end
