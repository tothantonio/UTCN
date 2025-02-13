entity FIFO is
	port( A:in bit_vector(7 downto 0);
	Q:out bit_vector(7 downto 0);
	w:in bit;
	r:in bit);
end entity;

architecture ARH_FIFO of FIFO is
type MATRIX is array (0 to 3) of bit_vector(7 downto 0);
signal mem:MATRIX;
signal CLK:bit;
signal i:integer:=0;
signal prim:integer:=0;
begin
	process(CLK)
	begin
		CLK<=not CLK after 10ns;
	end process;
	
	process(w,r,CLK)
	begin
		if(CLK'event and CLK='1') then 
			if(w='1') then 
				if(i=3)
					then mem(i)<=A;
				else
			mem(i)<=A;
			i<=i+1;	  
			end if;
			elsif(r='1') then  
				if(mem(prim)="00000000")
					then Q<=mem(prim);
				else
					
				Q<=mem(0);
				mem(0)<=mem(1);
				mem(1)<=mem(2);
				mem(2)<=mem(3);
				mem(3)<="00000000";
				if(i>0) then
				i<=i-1;
				else
					i<=0;
				end if;
				
				end if;
			end if;			 
			end if;
			end process;
			end architecture;
			