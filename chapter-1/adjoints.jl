push!(LOAD_PATH, "../modules")
using IterTools
using Operators

X = Set(1:2)
Y = Set(1:6)

f(x) = 2 * x
g(y) = floor(y/2.0)
gl(y) = ceil(y/2.0)

is_right_adjoint(f, X, g, Y) = begin
           for pair in product(X,Y)
			  x,y  = pair   
			  if !( f(x) ⩽ y ⟺ x ⩽ g(y) ) return false end
		   end
           return true
       end

is_left_adjoint(f, X, g, Y) = begin
          for pair in product(X,Y)
			  x,y  = pair   
			  if !( gl(x) ⩽ y ⟺ x ⩽ f(y) ) return false end
		   end
           return true  
       end

#@show is_right_adjoint(f,X, g,Y)
#@show is_left_adjoint(f,X, g,Y)

@show X ↦ f