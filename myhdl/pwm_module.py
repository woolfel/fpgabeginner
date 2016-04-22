from myhdl import *

def pwm_module(period, t_on, pwm, period_end, clk):
	count = Signal(intbv(0)[16:])
	
	@always(clk.posedge)
	def logic():
		if count == period:
			count.next = 0
			period_end.next = 1
		else:
			count.next = count + 1
			period_end.next = 0

		if count > t_on:
			pwm.next = 0
		else:
			pwm.next = 1
	return logic
