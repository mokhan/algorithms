require 'set'

class SocialGraph
  attr_reader :reader, :writer

  def initialize(reader, writer)
    @reader, @writer = reader, writer
    @members = Hash.new { |hash, key| hash[key] = Member.new(key) }
  end

  def run(traversal = Traversal.new(writer))
    (reader.readline.to_i - 1).times do
      add_to_graph(reader.readline.strip)
    end

    member_for(reader.readline).tap do |root|
      traversal.traverse(root)
    end
  end

  private

  def add_to_graph(line)
    key, friend_keys = line.split(':')
    friend_keys.split(',').each do |friend|
      member_for(key).add_friend(member_for(friend))
    end unless friend_keys.nil?
  end

  def member_for(key)
    @members[key.strip]
  end
end

class Member
  include Enumerable

  attr_reader :name

  def initialize(name)
    @name = name
    @friends = []
  end

  def add_friend(friend)
    @friends << friend
  end

  def each
    @friends.each do |friend|
      yield friend
    end
  end

  def to_s
    name
  end

  def inspect
    name
  end

  def ==(other)
    name == other.name
  end
end

class Traversal
  attr_reader :writer

  def initialize(writer)
    @writer = writer
    @visited = { }
    @queue = []
  end

  def traverse(member)
    @queue = []
    @root = member
    @queue.push(member)
    until @queue.empty? do
      member = @queue.shift
      write(newline) if member.nil? && @queue.first
      next if member.nil?

      visit(member)
      added = false
      member.each do |friend|
        @queue.push(friend) if eligible?(friend)
        added = true
      end

      @queue.push(nil) if added
    end
  end

  private

  def eligible?(member)
    !visited?(member) && !root?(member) && !queued?(member)
  end

  def newline
    "\n"
  end

  def queued?(friend)
    @queue.find { |x| x == friend }
  end

  def visit(member)
    return if visited?(member) || root?(member)
    write(member.name) unless root?(member)
    write(",") unless @queue.first.nil?
    @visited[member.name] = true
  end

  def visited?(member)
    @visited.key?(member.name)
  end

  def root?(member)
    @root.name == member.name
  end

  def write(value)
    writer.write(value)
  end
end
