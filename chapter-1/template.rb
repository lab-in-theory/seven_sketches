X = 1..3   # an integer range
XY = []    # pairs of (x, f(x)); (x,f(x)-1); (x,f(x)+1)
RA = []    # collection of adjoint pairs

def f(x)
  2*x
end

def g(y)
  y/2.0.floor
end

X.each { |x|
  XY << [ x, f(x)-1] if (f(x) - 1 > 0)
  XY << [ x, f(x) ]
  XY << [ x, f(x)+1] if (f(x) + 1 < f(X.last))
}

XY.each { |pair| 
  x = pair.first
  y = pair.last
  RA << pair if ( (f(x) <= y) &&  (x <= g(y)) )
  #RA << pair if (!(f(x) <= y) && !(x <= g(y)  )                           )
} 

puts "XY pairs: " + XY.to_s
puts "RA pairs: " + RA.to_s