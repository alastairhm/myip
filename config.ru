run lambda {|env| [200, {'Content-Type'=>'text/plain'}, [env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR']]] }
