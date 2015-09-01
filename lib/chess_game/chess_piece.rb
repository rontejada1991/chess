class ChessPiece
  attr_accessor :name, :unicode, :is_dead

  def initialize name, unicode, is_dead = false
    @name = name
    @unicode = unicode.encode('utf-8')
    @is_dead = is_dead
  end
end