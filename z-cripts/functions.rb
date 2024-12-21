# arrow function: ( duas formas de escrever )
func = -> (arg) { arg + 1 }
func = lambda (arg) { arg + 1 }


doubler = Proc.new { |x| x * 2 } # pode receber mais de um parametro que não da erro. Outras formas dá erro de num argumentos

def double(x)
  x * 2
end

def pipeline(*funcs) # numero variado de argumentos num array funcs
  # retorna uma arrow function
  -> (arg) {
    
    param = arg
    
    funcs.each do | func |
     param = func.call(param)
    end
    
    param
  }
end

puts func.call(1) # should print 2

fun = pipeline(-> (x) { x * 3 }, -> (x) { x + 1 }, -> (x) { x / 2 })
puts (fun.call(3)) # should print 5
