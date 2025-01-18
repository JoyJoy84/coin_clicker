/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 02FE9B0B
/// @DnDInput : 2
/// @DnDArgument : "funcName" "align_string"
/// @DnDArgument : "arg" "str"
/// @DnDArgument : "arg_1" "length"
function align_string(str, length) 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2B51D508
	/// @DnDParent : 02FE9B0B
	/// @DnDArgument : "var" "new_str"
	/// @DnDArgument : "value" """"
	var new_str = "";

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 70E43DBD
	/// @DnDParent : 02FE9B0B
	/// @DnDArgument : "init" "i = 1"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "i < string_length(str) + 1"
	for(var i = 1; i < string_length(str) + 1; i += 1) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6305D415
		/// @DnDParent : 70E43DBD
		/// @DnDArgument : "expr" "string_char_at(str, i)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "new_str"
		new_str += string_char_at(str, i);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5DA86480
		/// @DnDParent : 70E43DBD
		/// @DnDArgument : "var" "string_width(new_str)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "length"
		if(string_width(new_str) > length)
		{
			/// @DnDAction : YoYo Games.Loops.While_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 72D30931
			/// @DnDParent : 5DA86480
			/// @DnDArgument : "var" "string_char_at(new_str, i)"
			/// @DnDArgument : "not" "1"
			/// @DnDArgument : "value" "" ""
			while (!(string_char_at(new_str, i) == " ")) {
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 7DE1D714
				/// @DnDInput : 3
				/// @DnDParent : 72D30931
				/// @DnDArgument : "var" "new_str"
				/// @DnDArgument : "function" "string_delete"
				/// @DnDArgument : "arg" "new_str"
				/// @DnDArgument : "arg_1" "i"
				/// @DnDArgument : "arg_2" "1"
				new_str = string_delete(new_str, i, 1);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 1AB7C872
				/// @DnDParent : 72D30931
				/// @DnDArgument : "expr" "-1"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "i"
				i += -1;
			}
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 614EA019
			/// @DnDInput : 3
			/// @DnDParent : 5DA86480
			/// @DnDArgument : "var" "new_str"
			/// @DnDArgument : "function" "string_delete"
			/// @DnDArgument : "arg" "new_str"
			/// @DnDArgument : "arg_1" "i"
			/// @DnDArgument : "arg_2" "1"
			new_str = string_delete(new_str, i, 1);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 34D5C578
			/// @DnDParent : 5DA86480
			/// @DnDArgument : "expr" ""\n""
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "new_str"
			new_str += "\n";
		}
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 3067DE2D
	/// @DnDParent : 02FE9B0B
	/// @DnDArgument : "value" "new_str"
	return new_str;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 61E5FF3E
/// @DnDInput : 7
/// @DnDArgument : "funcName" "draw_text_line"
/// @DnDArgument : "arg" "font"
/// @DnDArgument : "arg_1" "str"
/// @DnDArgument : "arg_2" "tx"
/// @DnDArgument : "arg_3" "ty"
/// @DnDArgument : "arg_4" "xscale"
/// @DnDArgument : "arg_5" "yscale"
/// @DnDArgument : "arg_6" "length"
function draw_text_line(font, str, tx, ty, xscale, yscale, length) 
{
	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 2DA723A0
	/// @DnDParent : 61E5FF3E
	/// @DnDArgument : "font" "font"
	draw_set_font(font);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2EBEFB82
	/// @DnDInput : 2
	/// @DnDParent : 61E5FF3E
	/// @DnDArgument : "var" "new_str"
	/// @DnDArgument : "function" "align_string"
	/// @DnDArgument : "arg" "str"
	/// @DnDArgument : "arg_1" "length"
	new_str = align_string(str, length);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 4823F851
	/// @DnDParent : 61E5FF3E
	/// @DnDArgument : "x" "tx"
	/// @DnDArgument : "y" "ty"
	/// @DnDArgument : "xscale" "xscale"
	/// @DnDArgument : "yscale" "yscale"
	/// @DnDArgument : "caption" ""
	/// @DnDArgument : "text" "new_str"
	draw_text_transformed(tx, ty, "" + string(new_str), xscale, yscale, 0);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4367B632
/// @DnDArgument : "funcName" "shorten_num"
/// @DnDArgument : "arg" "num"
function shorten_num(num) 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2E16D6EF
	/// @DnDParent : 4367B632
	/// @DnDArgument : "var" "new_str"
	/// @DnDArgument : "value" """"
	var new_str = "";

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2E6FF2CC
	/// @DnDParent : 4367B632
	/// @DnDArgument : "var" "num"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "1000000000"
	if(num >= 1000000000)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 28618917
		/// @DnDParent : 2E6FF2CC
		/// @DnDArgument : "expr" "string(floor(num / 1000000000))"
		/// @DnDArgument : "var" "new_str"
		new_str = string(floor(num / 1000000000));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2A9F8252
		/// @DnDParent : 2E6FF2CC
		/// @DnDArgument : "var" "floor((num % 1000000000) / 100000000)"
		/// @DnDArgument : "not" "1"
		if(!(floor((num % 1000000000) / 100000000) == 0))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6C1BC47D
			/// @DnDParent : 2A9F8252
			/// @DnDArgument : "expr" ""." + string(floor((num % 1000000000) / 100000000))"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "new_str"
			new_str += "." + string(floor((num % 1000000000) / 100000000));
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2E8BAEE5
		/// @DnDParent : 2E6FF2CC
		/// @DnDArgument : "expr" ""B""
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "new_str"
		new_str += "B";
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 191193BE
	/// @DnDParent : 4367B632
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 08FE0279
		/// @DnDParent : 191193BE
		/// @DnDArgument : "var" "num"
		/// @DnDArgument : "op" "4"
		/// @DnDArgument : "value" "1000000"
		if(num >= 1000000)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 447C08FB
			/// @DnDParent : 08FE0279
			/// @DnDArgument : "expr" "string(floor(num / 1000000))"
			/// @DnDArgument : "var" "new_str"
			new_str = string(floor(num / 1000000));
		
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 20BF127E
			/// @DnDParent : 08FE0279
			/// @DnDArgument : "var" "floor((num % 1000000) / 100000)"
			/// @DnDArgument : "not" "1"
			if(!(floor((num % 1000000) / 100000) == 0))
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 34991336
				/// @DnDParent : 20BF127E
				/// @DnDArgument : "expr" ""." + string(floor((num % 1000000) / 100000))"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "new_str"
				new_str += "." + string(floor((num % 1000000) / 100000));
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5178D299
			/// @DnDParent : 08FE0279
			/// @DnDArgument : "expr" ""M""
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "new_str"
			new_str += "M";
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 348462CE
		/// @DnDParent : 191193BE
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2F4990FA
			/// @DnDParent : 348462CE
			/// @DnDArgument : "var" "num"
			/// @DnDArgument : "op" "4"
			/// @DnDArgument : "value" "1000"
			if(num >= 1000)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6B6D5042
				/// @DnDParent : 2F4990FA
				/// @DnDArgument : "expr" "string(floor(num / 1000))"
				/// @DnDArgument : "var" "new_str"
				new_str = string(floor(num / 1000));
			
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 1F9CB719
				/// @DnDParent : 2F4990FA
				/// @DnDArgument : "var" "floor((num % 1000) / 100)"
				/// @DnDArgument : "not" "1"
				if(!(floor((num % 1000) / 100) == 0))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 0DED3DC7
					/// @DnDParent : 1F9CB719
					/// @DnDArgument : "expr" ""." + string(floor((num % 1000) / 100))"
					/// @DnDArgument : "expr_relative" "1"
					/// @DnDArgument : "var" "new_str"
					new_str += "." + string(floor((num % 1000) / 100));
				}
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 4CA44090
				/// @DnDParent : 2F4990FA
				/// @DnDArgument : "expr" ""K""
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "new_str"
				new_str += "K";
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 288C050C
			/// @DnDParent : 348462CE
			else
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 0CAEC835
				/// @DnDParent : 288C050C
				/// @DnDArgument : "expr" "string(num)"
				/// @DnDArgument : "var" "new_str"
				new_str = string(num);
			}
		}
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 04EF40E2
	/// @DnDParent : 4367B632
	/// @DnDArgument : "value" "new_str"
	return new_str;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 5A7CE921
/// @DnDInput : 6
/// @DnDArgument : "funcName" "draw_num"
/// @DnDArgument : "arg" "tx"
/// @DnDArgument : "arg_1" "ty"
/// @DnDArgument : "arg_2" "xscale"
/// @DnDArgument : "arg_3" "yscale"
/// @DnDArgument : "arg_4" "font"
/// @DnDArgument : "arg_5" "num"
function draw_num(tx, ty, xscale, yscale, font, num) 
{
	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 5E436331
	/// @DnDParent : 5A7CE921
	/// @DnDArgument : "font" "font"
	draw_set_font(font);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 7C9B958D
	/// @DnDParent : 5A7CE921
	/// @DnDArgument : "var" "new_str"
	/// @DnDArgument : "function" "shorten_num"
	/// @DnDArgument : "arg" "num"
	new_str = shorten_num(num);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 4DD870DB
	/// @DnDParent : 5A7CE921
	/// @DnDArgument : "x" "tx"
	/// @DnDArgument : "y" "ty"
	/// @DnDArgument : "xscale" "xscale"
	/// @DnDArgument : "yscale" "yscale"
	/// @DnDArgument : "caption" ""
	/// @DnDArgument : "text" "new_str"
	draw_text_transformed(tx, ty, "" + string(new_str), xscale, yscale, 0);
}