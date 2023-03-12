  module INST_ROM(
	
     input  [31:0] address, 
     output [31:0] inst
     );
     //只读的指令存储器，输入为地址，输出为指令，在computer中使用
       wire [31:0] ram [0:31];
    assign ram[5'h00]=32'h00002820; //Add $a1, $0, $0   ;    				
    assign ram[5'h01]=32'h8CB10000; //Lw   $s1, 0($a1)  ; ram0 = 30   
    assign ram[5'h02]=32'h8CB20004; //Lw   $s2, 4($a1)  ; ram1 = 20
    assign ram[5'h03]=32'h3e330001; //Lui $s3, $s1, 16’h0001 高位置数;
    assign ram[5'h04]=32'h02519824; //And $s3, $s1, $s2 与，结果为20;
    assign ram[5'h05]=32'h02519825; //Or  $s3, $s1, $s2 或，结果为30;
    assign ram[5'h06]=32'h02519826; //Xor $s3, $s1, $s2 异或，结果为10;
    
    assign ram[5'h07]=32'h02328820; //Add $s1, $s1, $s2 ; 
    assign ram[5'h08]=32'h8CB20008; //Lw   $s2, 8($a1)  ; ram2 = -10
    assign ram[5'h09]=32'h12320001; //Beq $s1, $s2, 1   ; 不会跳转
    assign ram[5'h0A]=32'hACA0000C; //Sw   $0, 12($a1)  ; ram[3] = 40 如果跳转，则后续读取是原本的数值40，没有跳转数据应该是0
    assign ram[5'h0B]=32'h8CB1000C; //lw   $s1, 12($a1) ; 
    //此时ram3为0
    //再次加载
    assign ram[5'h0C]=32'h8CB10000; //Lw   $s1, 0($a1)  ; ram0 = 30   
    assign ram[5'h0D]=32'h8CB20004; //Lw   $s2, 4($a1)  ; ram1 = 20
    assign ram[5'h0E]=32'h02328822; //Sub $s1, $s1, $s2 ; 相减
    assign ram[5'h0F]=32'hAE40000C; //Sw   $2, 12($a1)  ; ram[3] = 20
    assign ram[5'h10]=32'h8CB20008; //Lw   $s2, 8($a1)  ; ram2 = -10
    assign ram[5'h11]=32'h12320001; //Beq $s1, $s2, 1   ; 跳转
    assign ram[5'h12]=32'hACA0000C; //Sw   $0, 12($a1)  ;  如果跳转，则后续读取是原本的数值20，没有跳转数据应该是0
    assign ram[5'h13]=32'h8CB1000C; //lw   $s1, 12($a1) ; 
    assign ram[5'h14]=32'h8CB1000C; //lw   $s1, 12($a1) ; 
    assign inst=ram[address[6:2]];
 endmodule
 
\end{lstlisting}
\subsection{Data MEM模块设计与实现}
为测试lw和sw指令，数据存储器件也存有一些数据，其编码如下：
\begin{lstlisting}[style={prettyverilog}]
  module DATA_RAM(
		input        Clock,
		output[31:0] dataout,
		input [31:0] datain,
		input [31:0] addr,
		input        write , read
    );
//RAM 用于存储数据，相当于内存
   reg [31:0] ram [0:31];
	
	assign dataout = read ? ram[addr[6:2]] : 32'hxxxxxxxx;
// 时钟下降沿的时候写内存	
	always @ (posedge Clock) begin
			if (write) ram[addr[6:2]] = datain;
	end
	
	integer i;
	
	initial begin
	//set data_ram number
			ram[0]= 30;
			ram[1]= 20;
			ram[2]= 10;
			ram[3]= 40;
	end		

endmodule