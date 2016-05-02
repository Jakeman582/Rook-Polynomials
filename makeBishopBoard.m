function [bishopBoard] = makeBishopBoard(rookBoard)
%makeBishopBoard Creates an analogous bishop board for the given board.
%--------------------------------------------------------------------------
%Author: Jacob Hiance
%
%Purpose: Creates a new chessboard by treating bishops as rooks for
%         diagonals of a chessboard. Since bishops attack along diagonals,
%         we can transform the board by turning diagonals into rows and
%         columns (which also turns rows and columns into diagonals). This
%         allows us to calculate the bishop polynomial of a given board by
%         simply calculating the rook polynomial of the bishop board.
%         
%         To do this transformation, we consider a new coordinate system:
%         define 'positive diagonals' as diagonals along the given board
%         that travel in a bottom-left to top-right direction, and define
%         'negative diagonals' as diagonals that travel in a top-left to
%         bottom-right direction. The 1st positive diagonal corresponds to
%         the cell (1, 1) in the given board, and the last positive
%         diagonal corresponds to cell at the last row and last column.
%         
%         Similarly, the first negative diagonal corresponds to cell in the
%         first column of the last row of the given board, and the last
%         negative diagonal corresponds to the cell in the last column of
%         the first row of the given board.
%         
%         These coordinates that are based on positive diagonals and
%         negative diagonals are called Hiance coordinates. To transform
%         the given rook board into a bishop board, we simply copy the
%         component in row r and column c of the given rook board into row
%         J and column H of the bishop board where J is the Jth positive 
%         diagonal on which cell (r,c) lies and H is the Hth negative 
%         diagonal on which cell (r,c) lies. Any cells in the bishop board
%         that are not assigned a value by this copy procedure are "Ghost"
%         cells and are assigned NaN.
%         
%         The bishop board will be a square matrix with a number of rows
%         equal to (rows + columns - 1) where rows = the number of rows in
%         the given rook board and columns = the number of columns in the
%         given rook board.
%
%Inputs:
%rookBoard --> The rook board for which a bishop board will be made.
%
%Outputs:
%bishopBoard --> The associated bishop board of the given rook board
%
%Required Helper Functions:
%No required helper functions.
%--------------------------------------------------------------------------

   % Get the dimension of the new bishop board, and initialize each
   % component to NaN.
   [rows,columns] = size(rookBoard);
   bishopBoard = nan(rows+columns-1);
   
   % We need to determine in which positive diagonal each cell lies. J(i,j) 
   % will specify in which positive diagonal that cell (i,j) of rookBoard 
   % lies.
   J = zeros(size(rookBoard));
   
   % We also need to determine in which negative diagonal each cell lies.
   % H(i,j) will specify in which negative diagonal cell (i,j) of rookBoard
   % lies.
   H = zeros(size(rookBoard));
   
   % Iterate over rookBoard and assign to each cell (i,j) its positive
   % diagonal coordinate (J) and its negative diagonal coordinate (H).
   for i = 1:rows
      for j = 1:columns
         J(i,j) = i + j - 1;
         H(i,j) = (rows - i + 1) + j - 1;
      end
   end

   % Copy values from rookBoard into their respective position in
   % bishopBoard.
   for i = 1:rows
      for j = 1:columns
         bishopBoard(J(i,j),H(i,j)) = rookBoard(i,j); 
      end
   end
   
end