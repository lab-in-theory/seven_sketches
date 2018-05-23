using LightGraphs
using GraphPlot


# labels := Array of all point lables, index of label in array corresponds to both it's 
# horizontal and vertical index
labels = ['a', 'b', 'c', 'd','e']

# adjacency matrix := Matrix represneting the partial ordering of the labels
adjacency_matrix = [ # a b c d e
                       0 1 1 0 0; # a
                       0 0 0 1 0; # b
                       0 0 0 0 1; # c
                       0 0 0 0 0; # d
                       0 0 0 0 0; # e
                   ]


ordered_set = DiGraph(adjacency_matrix)
@show ordered_set
display(gplot(ordered_set))