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
## @deftypefn {} {@var{retval} =} falsePos_method (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: RSD <RSD@DESKTOP-KH4J3AC>
## Created: 2019-10-22

function retval = falsePos_method (f,a,b,err)
if(nargin!=3)
  error("Usage: falsePos_Method(function,lowerlimit,upperlimit,error)");
endif

fa=f(a);
fb=f(b);

if((fa*fb)>0)
  error("root out of bound");
elseif fa==0
  retval=a;
elseif fb==0
  retval=b;
else
  retval=(a*fb-b*fa)/(fb-fa);

  while(abs(fa-fb)>err)
    retval=(a*fb-b*fa)/(fb-fa);
    fx=f(retval);
    fa=f(a);
    fb=f(b);
    if(fx==0)
      break;
    elseif((fa*fx)<0)
      b=retval;
      fb=fx;
    else
      a=retval;
      fa=fx;
    endif
  endwhile
disp(sprintf("The root is %0.7f",retval));
endif

endfunction
