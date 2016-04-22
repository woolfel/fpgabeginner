from myhdl import *
from pwm_module import * 

def TestBench():
	clk = Signal(bool(0))
	period = Signal(intbv(200)[16:])
	t_on = Signal(intbv(100)[16:])
	pwm_out = Signal(bool(0))
	period_end = Signal(bool(0))

	pwm_inst = toVHDL(pwm_module, period, t_on, pwm_out, period_end, clk)     
	@always(delay(1))
	def tb_clkgen():
		clk.next = not clk

	@instance
	def tb_stim():
		period = 200
		t_on = 100      
		yield delay(2)
		for ii in xrange(400):
			yield clk.negedge
			print("%3d  %s" % (now(), bin(pwm_out, 1)))

		raise StopSimulation
	return tb_clkgen, tb_stim, pwm_inst

if __name__ == '__main__':
	Simulation(TestBench()).run()
