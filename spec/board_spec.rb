require "board"
require "game"

describe Board do
  subject(:board) { Board.new }

  describe "#endgame_check" do
    it "registers win across top row" do
      board.mark_space(1, 1)
      board.mark_space(2, 1)
      board.mark_space(3, 1)
      expect(board.endgame_check).to eq(1)
    end

    it "registers win across middle row" do
      board.mark_space(4, -1)
      board.mark_space(5, -1)
      board.mark_space(6, -1)
      expect(board.endgame_check).to eq(1)
    end

    it "registers win across bottom row" do
      board.mark_space(7, 1)
      board.mark_space(8, 1)
      board.mark_space(9, 1)
      expect(board.endgame_check).to eq(1)
    end

    it "registers win down left column" do
      board.mark_space(1, 1)
      board.mark_space(4, 1)
      board.mark_space(7, 1)
      expect(board.endgame_check).to eq(1)
    end    

    it "registers win down middle column" do
      board.mark_space(2, -1)
      board.mark_space(5, -1)
      board.mark_space(8, -1)
      expect(board.endgame_check).to eq(1)
    end  

    it "registers win down right column" do
      board.mark_space(3, 1)
      board.mark_space(6, 1)
      board.mark_space(9, 1)
      expect(board.endgame_check).to eq(1)
    end  

    it "registers across diagonal" do
      board.mark_space(1, 1)
      board.mark_space(5, 1)
      board.mark_space(9, 1)
      expect(board.endgame_check).to eq(1)
    end  

    it "registers across opposite diagonal" do
      board.mark_space(3, -1)
      board.mark_space(5, -1)
      board.mark_space(7, -1)
      expect(board.endgame_check).to eq(1)
    end

    it "calls a draw" do
      9.times { |i| board.mark_space(i + 1, 0) }
      expect(board.endgame_check).to eq(-1)
    end

    it "calls a win before a draw" do
      3.times { |i| board.mark_space(i + 1, 1) }
      6.times { |i| board.mark_space(i + 1, 0) }
      expect(board.endgame_check).to eq(1)
    end
  end
end