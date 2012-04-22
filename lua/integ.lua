#!/usr/bin/env lua
require("math")

function main(n)
   print ("n=" .. tostring(n) ..  "   Rectangles\tTrapezes\tSimpson")
   print ("F1:\t" ..integ(1, n))
   print ("F2:\t" ..integ(2, n))
   print ("F3:\t" ..integ(3, n))
   print ("F4:\t" ..integ(4, n))
   print ("F5:\t" ..integ(5, n))
   print ("F6:\t" ..integ(6, n))
   print ("F7:\t" ..integ(7, n))
   print ("F8:\t" ..integ(8, n))
   print ("F9:\t" ..integ(9, n))
   print ("F10:\t" ..integ(10, n))
end

function integ (f, n)
   a = 0.0
   b = 1.0
   h = (b - a) / n
   string =
      string.format("%.1E\t\t", rectangles(f, n, a, h)) ..
      string.format("%.1E\t\t", trapezes(f, n, a, b, h)) ..
      string.format("%.1E\t\t", simpson(f, n, a, b, h))
   return string
end

function rectangles(f, n, a, h)
   s = 0.0
   token = 0.0

   while token < n do
      s = s + fu(f, (a + h * token))
      token = token + 1.0
   end
   return math.abs((h * s) - 1.0)
end

function trapezes(f, n, a, b, h)
   s = 0.0
   token = 1.0

   while token < n do
      s = s + fu(f, a + (token * h))
      token = token + 1.0
   end
   return math.abs((((b - a) / (2.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s))) - 1.0)
end

function simpson(f, n, a, b, h)
   s1 = 0.0
   s2 = 0.0
   token = 1.0

    while token < n do
       s1 = s1 + fu(f, a + (token * h))
       token = token + 1.0
    end
    token = 0.0
    while token < n do
       s2 = s2 + fu(f, a + (token * h) + (h / 2))
       token = token + 1.0
    end
    return math.abs((((b - a) / (6.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s1 + 4.0 * s2))) - 1.0)
end

function fu(i, x)
   if i == 1 then
      return 1.0
   elseif i == 2 then
      return (2.0 * x)
   elseif i == 3  then
      return (3.0 * math.pow(x, 2.0))
   elseif i == 4  then
      return 4.0 * math.pow(x, 3.0)
   elseif i == 5 then
      return 5.0 * math.pow(x, 4.0)
   elseif i == 6 then
      return 6.0 * math.pow(x, 5.0)
   elseif i == 7 then
      return 1.0 / (2.0 * (math.sqrt(2.0) - 1.0) * math.sqrt(x + 1.0))
   elseif i == 8 then
      return 2.0 / math.pow((x + 1.0), 2.0)
   elseif i == 9 then
      return (math.pi / 2.0) * math.sin((math.pi / 2.0) * x)
   elseif i == 10 then
      return math.pow(math.exp(1), x) / (math.exp(1) - 1)
   else
      return 1.0
   end
end

if #arg < 1
then
   print "Bad option"
   return
elseif tonumber(arg[1]) == nil then
   print "Bad option"
   return
elseif tonumber(arg[1]) < 10 then
   print "Bad option"
   return
elseif tonumber(arg[1]) > 100 then
   print "Bad option"
   return
end
main(tonumber(arg[1]))
