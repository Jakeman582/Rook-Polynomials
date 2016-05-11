# Rook-Polynomials
A set of Matlab routines used to calculate the rook polynomial, bishop polynomial, and queen polynomial of a given chessboard, represented as a matrix.

A rook polynomial is a type of generating function that encodes the number of ways to place any number of rooks on a given chess board such that no rook can be captured by any other rook. For example, consider the 3 by 3 chessboard given below:

[][][]
[][][]
[][][]

The rook polynomial of this chessboard is 1 + 9x + 18x^2 + 6x^3. Here, the exponent of x represents the number of rooks being placed on the chess board, and the coefficient tells you how many ways there are to place those rooks such that no rook can be captured. Becuase the coefficient of x^3 is 6, there are 6 ways to place 3 rooks on the 3 by 3 chessboard such that no rook is attacked by any other rook.

To do this calculation, use the following code:

#Calculating the rook polynomial of the standard 3 by 3 chess board
board = [1, 1, 1; 1, 1, 1; 1, 1, 1];
rook_poly = rookPoly(board); #rook_poly = [1 9 18 6]

The result will be a vector that contains the coefficients of the polynomial in ascending order.

A chess board does not have to be square. For example, consider the 3 by 4 chessboard below:

[][][][]
[][][][]
[][][][]

The rook polynomial of this board is 1 + 12x + 36x^2 + 24x^3.

Chess boards are also allowed to have holes, or gaps. For example, we can have a 3 by 3 chess board with the center removed, pictured below:

[][][]
[]  []
[][][]

The rook polynomial of this board is 1 + 8x + 14x^2 + 4x^3.

In order to represent holes in these boards, use NaN when defining the matrix. To encode the above example in matlab, use the following code:

#Defining a 3 by 3 chess board with the center square removed
board = [1, 1, 1; 1, NaN, 1; 1, 1, 1];

As another example, consider a 3 by 3 board with the corners removed:

  []  
[][][]
  []  
  
To encode this matrix, use this code:

#Defining a 3 by 3 board with the corner squares removed
board = [NaN, 1, NaN; 1, 1, 1; NaN, 1, NaN];

This code does not take into account any color scheme of the chess board. The color of the squares will not affect the calculation of the rook polynomials. The important thing to remember when defining your matrix representation is that holes must be represented as NaN. Any non-NaN component will be treated as a plain square. For example, the 3 by 3 board with the center square could have been encoded using the following initialization:

#An example of defining the 3 by 3 board with the center removed
board = [1, 2, 3; 4, NaN, 6; 7, 8, 9];

Bishop polynomials and queen polynomials are analogous to rook polynomials. By using a coordinate transform, it is possible to calculate the bishop polynomial of a board by calculating the rook polynomial of the transformed board. Thus, as of now (May 7, 2016), in order to calculate the bishop polynomial of a board, you must pass the defined board as an argument to makeBishopBoard. You can then calculate the bishop polynomial of the board. For example, to calculate the bishop polynomial of the standard 3 by 3 board, use the following code:

#Calculating the bishop polynomial of the standard 3 by 3 chess board
board = [1, 1, 1; 1, 1, 1; 1, 1, 1];
bishop_board = makeBishopBoard(board);
bishop_poly = rookPoly(bishopBoard);

#A more concise way of calculating the bishop polynomial of the standard 3 by 3 chess board
board = [1, 1, 1; 1, 1, 1; 1, 1, 1];
bishop_poly = rookPoly(makeBishopBoard(board));

Queen polynomials can be calculated by simply calling the queenPoly function on a matrix.

#Calculating the queen polynomial of the standard 3 by 3 board
board = [1, 1, 1; 1, 1, 1; 1, 1, 1];
queen_poly = queenPoly(board);
