require 'agoo'

Agoo::Log.configure(dir: 'log',
		    console: true,
		    classic: true,
		    colorize: true,
		    states: {
		      INFO: true,
		      DEBUG: false,
		      connect: true,
		      request: true,
		      response: true,
		      eval: true,
		      push: true,
		    })

Agoo::Server.init(3000, 'public',
		  thread_count: 0,
		  worker_count: 1,
		  root_first: true,
		 )

class HelloWorld
  def call(env)
    [200, {}, ["Found"]]
  end
end

Agoo::Server.start()

