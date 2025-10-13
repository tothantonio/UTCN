class Node():

    def __init__(self, vertex_number):
        self.vertex_number = vertex_number
        self.neighbours = []

    def edge(self, node):
        self.neighbours.append(node)

    def __str__(self):
        return f'({self.vertex_number})'

    def print_graph(nodes):
        for node in nodes:
            for neighbour in node.neighbours:
                print(f"{node}->{neighbour}")

    def get_out_degree(self):
        return len(self.neighbours)

    def max_out_degree(nodes):
        max_node = nodes[0]
        max_out_degree = max_node.get_out_degree()

        for node in nodes:
            out_degree = node.get_out_degree()
            if out_degree > max_out_degree:
                max_out_degree = out_degree
                max_node = node

        print(max_node)

    # def random_subgraph(nodes):


nodes = []
for i in range(7):
    nodes.append(Node(i))
nodes[1].edge(nodes[3])
nodes[1].edge(nodes[6])
nodes[2].edge(nodes[6])
nodes[3].edge(nodes[3])
nodes[3].edge(nodes[4])
nodes[5].edge(nodes[2])
nodes[6].edge(nodes[3])
nodes[6].edge(nodes[4])
nodes[6].edge(nodes[5])

Node.print_graph(nodes)

Node.max_out_degree(nodes)
