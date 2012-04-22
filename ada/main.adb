with Ada.Text_IO;
with Ada.Long_Float_Text_IO;
with Ada.Command_line;
with Ada.Strings.Unbounded;
with Ada.Characters.Latin_1;
with Ada.Numerics.Long_Elementary_Functions;

procedure Main is
    function fu(i : Integer; x : Long_Float) return Long_Float is
    begin
        case i is
            when 1 => return 1.0;
            when 2 => return 2.0 * x;
            when 3 => return 3.0 * (x ** 2);
            when 4 => return 4.0 * (x ** 3);
            when 5 => return 5.0 * (x ** 4);
            when 6 => return 6.0 * (x ** 5);
            when 7 => return 1.0 / (2.0 *
	      (Ada.Numerics.Long_Elementary_Functions.Sqrt(2.0) - 1.0) *
	      Ada.Numerics.Long_Elementary_Functions.Sqrt(x + 1.0));
            when 8 => return 2.0 / ((x + 1.0) ** 2);
            when 9 => return (Ada.Numerics.Pi / 2.0) *
	      Ada.Numerics.Long_Elementary_Functions.Sin((Ada.Numerics.Pi / 2.0) * x);
            when 10 => return Ada.Numerics.Long_Elementary_Functions.Exp(x) /
	      (Ada.Numerics.Long_Elementary_Functions.Exp(1.0) - 1.0);
            when others => return 0.0;
        end case;
    end fu;

    function rectangles(f : Integer; n : Integer; a : Long_Float; h : Long_Float) return Long_Float is
        s : Long_Float := 0.0;
        i : Integer := 0;
    begin
        while i < n loop
            s := s + fu(f, a + h * Long_Float(i));
            i := i + 1;
        end loop;
        return abs ((h * s) - 1.0);
    end rectangles;

    function trapezes(f : Integer; n : Integer; a : Long_Float; b : Long_Float; h : Long_Float) return Long_Float is
        s : Long_Float := 0.0;
        i : Integer := 0;
    begin
        while i < n loop
            s := s + fu(f, a + (Long_Float(i) * h));
            i := i + 1;
        end loop;
        return abs((((b - a) / (2.0 * Long_Float(n))) * (fu(f, a) + fu(f, b) + (2.0 * s))) - 1.0);
    end trapezes;

    function simpson(f : Integer; n : Integer; a : Long_Float; b : Long_Float; h : Long_Float) return Long_Float is
        s1 : Long_Float := 0.0;
        s2 : Long_Float := 0.0;
        i : Integer := 0;
    begin
        while i < n loop
            s1 := s1 + fu(f, a + (Long_Float(i) * h));
            i := i + 1;
        end loop;
        i := 0;
        while i < n loop
            s2 := s2 + fu(f, a + (Long_Float(i) * h) + (h / 2.0));
            i := i + 1;
        end loop;
        return abs ((((b - a) / (6.0 * Long_Float(n))) * (fu(f, a) + fu(f, b) + (2.0 * s1 + 4.0 * s2))) - 1.0);
    end simpson;

    package SU renames Ada.Strings.Unbounded;

    procedure integ(f : Integer; n : Integer) is
        a : Long_Float := 0.0;
        b : Long_Float := 1.0;
        h : Long_Float := (b - a) / Long_Float(n);
        tmp : String := "       ";
        ret : SU.Unbounded_String := su.to_unbounded_string("");
    begin
        Ada.Long_Float_Text_IO.Put(tmp, rectangles(f, n, a, h), 1);
        Ada.Text_Io.Put(tmp & Ada.Characters.Latin_1.HT & Ada.Characters.Latin_1.HT);
        Ada.Long_Float_Text_Io.Put(tmp, trapezes(f, n, a, b, h), 1);
        Ada.Text_Io.Put(tmp & Ada.Characters.Latin_1.HT & Ada.Characters.Latin_1.HT);
        Ada.Long_Float_Text_Io.Put(tmp, simpson(f, n, a, b, h), 1);
        Ada.Text_Io.Put(tmp);
    end integ;

    nb : Integer;

begin
    if Ada.Command_line.Argument_Count = 1 then
        nb := Integer'Value(Ada.Command_line.Argument(1));
        if nb < 10 or else nb > 100 then
            Ada.Text_IO.Put("Bad option");
        else
            Ada.Text_IO.Put("n = " & Ada.Command_line.Argument(1) & Ada.Characters.Latin_1.HT & "Rectangles" & Ada.Characters.Latin_1.HT & "Trapezes" & Ada.Characters.Latin_1.HT & "Simpson");
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F1:" & Ada.Characters.Latin_1.HT);
            integ(1, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F2:" & Ada.Characters.Latin_1.HT);
            integ(2, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F3:" & Ada.Characters.Latin_1.HT);
            integ(3, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F4:" & Ada.Characters.Latin_1.HT);
            integ(4, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F5:" & Ada.Characters.Latin_1.HT);
            integ(5, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F6:" & Ada.Characters.Latin_1.HT);
            integ(6, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F7:" & Ada.Characters.Latin_1.HT);
            integ(7, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F8:" & Ada.Characters.Latin_1.HT);
            integ(8, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F9:" & Ada.Characters.Latin_1.HT);
            integ(9, nb);
            Ada.Text_IO.New_line;
            Ada.Text_IO.Put("F10:" & Ada.Characters.Latin_1.HT);
            integ(10, nb);
            Ada.Text_IO.New_line;
        end if;
    end if;
end Main;
