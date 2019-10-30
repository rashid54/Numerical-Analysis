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
## @deftypefn {} {@var{retval} =} newtonRaphson_method (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: RSD <RSD@DESKTOP-KH4J3AC>
## Created: 2019-10-23

function ret = newtonRaphson_method (f,df,x0,err)
if(nargin!=4)
  error("Usage: newtonRaphson_method(function,derivative function,1st approximation,error")
elseif(f(x0)==0)
  ret=x0;
elseif(df(x0)==0)
  error("The value of df(x)=0");
else
  ret=x0-(f(x0)/df(x0));
  while(abs(ret-x0)>err)
    x0=ret;
    ret=x0-(f(x0)/df(x0));
  endwhile
endif
endfunction
