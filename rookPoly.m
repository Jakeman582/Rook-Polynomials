function [poly] = rookPoly(board)
%rookPoly Find the rook polynomial of the given board.
%/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\
%\  Author: Jacob Hiance                                                  /
%/                                                                        \
%\  Purpose: This function will return a vector of coefficients for the   /
%/           rook polynomial of the given board. The first numbers in     \
%\           vector are listed in ascending order of powers of x.         /
%/                                                                        \
%\  Example Usage: [poly] = rookPoly(x)                                   /
%/                                                                        \
%\  Inputs:                                                               /
%/  board --> A matrix representation of the desired chessboard.          \
%\            Any component of the matrix set to NaN (Not a Number)       /
%/            represents a "Ghost cell", a cell that is not actually a    \
%\            part of the board, but required to be included in the       /
%/            initialization. Any component of the matrix set to a number \
%\            represents a cell that is part of the board.                /
%/                                                                        \
%\  Example Board: board = [NaN,1,NaN;1,0,1;0,1,NaN] represents the board /
%/                   []                                                   \
%\                 [][][]                                                 /
%/                 [][]                                                   \
%\                                                                        /
%/  Outputs:                                                              \
%\  poly --> A vector of coefficients for the rook polynomial of the      /
%/           given board where the coefficients are given in ascending    \
%\           powers of x. For example, the vector [1 4 7 3 2] represents  /
%/           the polynomial 1 + 4x + 7x^2 + 3x^3 + 2x^4.                  \
%\                                                                        /
%/  Required Helper Functions:                                            \
%\  countCells                                                            /
%/  findFirst                                                             \
%\/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/

   % This is the base case polynomial for the 'Empty' board.
   % There is only 1 way to place a rook on an empty board:
   % simply don't place the rook.
   poly = 1;
   
   if(countCells(board) == 0)
       % This case is the 'Empty' board check.
       % There is only one way to place a rook
       % on the empty board, so return poly
       % unchanged.
      return; 
   elseif (countCells(board) == 1)
      % This board is a single cell. It is trivial to show
      % that the rook polynomial of the single cell is
      % 1 + x, or [1, 1] in vector notation.
      poly = [poly,1];
      return;
   else
      % At this point, we need to check two cases:
      % If there is a rook at the first non-NaN position
      % and if there is no rook at the first non-NaN position.
      
      % Find the first non-NaN position to use for the
      % casework.
      first = findFirst(board);
      
      % We found the spot to consider a rook placement.
      % Either there is a rook at first position, or there
      % is not a rook at first position.
      yesRook = board;
      noRook = board;
      
      % If there is a rook at first, then no other position on
      % the ith row or jth column can be used to place a rook in
      % the yesRook board. There can be no rook placed at the
      % forbidden cell in the the noRook board.
      forbiddenRow = first(1);
      forbiddenColumn = first(2);
      
      % Deleting cells in the yesRook board
      yesRook(forbiddenRow,:) = NaN;
      yesRook(:,forbiddenColumn) = NaN;
      
      % Deleting the forbidden cell in the noRook board.
      noRook(forbiddenRow,forbiddenColumn) = NaN;
      
      % We need to shift each power of x in polyWithRook by
      % 1 because we previously placed a rook at the first
      % position. This is after we find the rook polynomial
      % of the remaining sub-board.
      polyWithRook = [0,rookPoly(yesRook)];
      
      % We need to find the rook polynomial of the sub-board.
      polyNoRook = rookPoly(noRook);
      
      % Pad the end of shorter vector with zeros to make sure
      % polyNoRook and polyWithRook have the same dimension.
      if(length(polyNoRook) < length(polyWithRook))
         polyNoRook(numel(polyWithRook)) = 0;
      elseif (length(polyWithRook) < length(polyNoRook))
         polyWithRook(numel(polyNoRook)) = 0; 
      end
      
      % These were disjoint cases, so we must add the two
      % polynomials together.
      poly = polyWithRook + polyNoRook;
      
   end
end