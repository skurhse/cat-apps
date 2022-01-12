require "athena"

class MeowController < ATH::Controller
  @[ARTA::Get("/hello")]
  @[ATHA::QueryParam("name")]
  def hello(name : String?) : ATH::Response
    ATH::Response.new("#{name ? name.capitalize : "Meow"} World!\n")
  end

  @[ARTA::Get("/goodbye")]
  def goodbye() : ATH::Response
    ATH::Response.new("HISSSSSSSS\n", 500)
  end
end

ATH.run(8080, "localhost")
