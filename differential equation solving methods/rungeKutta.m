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
## @deftypefn {} {@var{retval} =} rungeKutta (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: RSD <RSD@DESKTOP-KH4J3AC>
## Created: 2019-10-30

function [x,y] = rungeKutta (f,x0,xn,y0,h)
  if(nargin!=5)
    error("Usage:rungeKutta(dx/dy function,x start,x end,y0,interval(h))");
  endif
  
  x=x0:h:xn;
  y(1)=y0;
  for(i=2:length(x))
    k1=(h*f(x(i-1),y(i-1)));
    k2=(h*f(x(i-1)+h,y(i-1)+k1));
    y(i)=y(i-1)+((k1+k2)/2);
  endfor
  [x' y']
endfunction
