require 'rspec/autorun'

class GraphNode

  attr_reader :name, :edges
  attr_accessor :visited

  def initialize(args={})
    @name  = args.fetch(:name, "")
    @edges = args.fetch(:edges, [])
    @visited = false
  end

  def add_edge(node)
    edges << node
  end

  def has_edges?
    !edges.empty?
  end

  def visit!
    self.visited = true
  end

  def visited?
    visited
  end

end



class Graph
  attr_reader :nodes

  def initialize()
    # We keep our nodes in a hash to keep constant-time
    # lookup
    @nodes = {}
  end

  def add_node(node)
    nodes[node.name] = node
  end

  def add_edge_between(parent_name, child_name)
    # create a relatinship (edge) between two
    # vertices in our graph
    nodes[parent_name].add_edge(nodes[child_name])
  end

  def search(search_term, node_to_search=nodes.values.first)
    raise "Cycle found" if node_to_search.visited?
    return true if search_term == node_to_search.name
    return false unless node_to_search.has_edges?
    node_to_search.visit!
    node_to_search.edges.any? do |node|
      search(search_term, node)
    end
  end

end




### TESTS

RSpec.describe "App" do

  let(:node_list) do
    ["alpha", "bravo", "charlie", "delta"].map {|name| GraphNode.new(name: name)}
  end

  describe "GraphNode" do

    context "#has_edges?" do

      it "returns true when it has children" do
        my_node = GraphNode.new
        my_node.add_edge(node_list.first)
        expect(my_node.has_edges?).to be true
      end

      it "returns false when it has no children" do
        expect(node_list.first.has_edges?).to be false
      end
    end


  end


  describe "Graph" do
    let(:graph) {Graph.new}

    describe "#search" do

      before do
        node_list.each {|node| graph.add_node(node)}
        graph.add_edge_between("alpha", "bravo")
        graph.add_edge_between("bravo", "charlie")
        graph.add_edge_between("bravo", "delta")
      end

      it "returns true when a graph contains element" do
        expect(graph.search("delta")).to be_truthy
      end

      it "returns false when a graph does not contains element" do
        expect(graph.search("zulu")).to be false
      end

      it "raises an exception when it contains a cycle" do
        graph.add_edge_between("delta", "bravo")
        expect{graph.search("zulu")}.to raise_error "Cycle found"
      end

    end

  end

end
