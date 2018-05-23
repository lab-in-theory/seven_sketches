

module Operators
  using LightGraphs, IterTools, Luxor, Colors
    
	export ⩽, ⟺, ↦ 

    ⟺(a,b) = (a && b) || (!a && !b)
    ⩽(a,b) = a <= b
    ↦(set,map) = graph_map_forward(set, map)


    graph_map_forward(set,map) = begin
       range = map(set[1]):map(set[length(set)])
       tuples = []
       for y in range
          for x in  domain
            if map(x) == y
               push!(tuples,(x,y))
            else
               push!(tuples,(y))
            end
          end
      end
       
       Drawing(1200, 1400)
       origin()
       cols = diverging_palette(60, 120, 20) # hue 60 to hue 120
       background(cols[1])
       setopacity(0.7)
       setline(2)
       y_index = -450
       for elem in set
           
            x = elem
            y = map(x) 
            setcolor(cols[rand(2:20)])
            p1 = Point(-500, y_index)
            p2 = Point(-100, y_index)

            circle(p1, 50, :fill)
            circle(p2, 50, :fill)

            setcolor(cols[rand(2:20)])
            setfont("Sans Serif", 40)
            t1 = Point(p1[1]-13, p1[2]+17)
            t2 = Point(p2[1]-13, p2[2]+17)
            settext("$x", t1)
            settext("$y", t2)

            setcolor(cols[rand(2:20)])
            a_start = Point(p1[1]+50, y_index)
            a_end   = Point(p2[1]-50, y_index)
            arrow(a_start, a_end,
            linewidth = 3.0,
            arrowheadlength = 20,
            arrowheadangle = pi/8)

            y_index = y_index+150
      end

       finish()
       preview()
    end
end