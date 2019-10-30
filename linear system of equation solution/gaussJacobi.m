## Copyright (C) 2019 RSD
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} gaussJacobi (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: RSD <RSD@DESKTOP-KH4J3AC>
## Created: 2019-10-30

function x = gaussJacobi (A,B,err)
  if(nargin!=3)
    error("Usage: gaussJacobi(A,B,error)");
  endif
  n=length(B);
  x=zeros(n,1);
  currErr=Inf;
  
  while(currErr>err)
    x0=x;
    for(i=1:n)
      sum=0;
      for(j=1:n)
        if(i~=j)
          sum=sum+(A(i,j)*x0(j));
        endif
      endfor
      x(i)=(B(i)-sum)/A(i,i);
    endfor
    currErr=abs(x-x0);
    endwhile

endfunction
