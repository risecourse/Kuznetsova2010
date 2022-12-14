TITLE applied current

COMMENT
Since this is an electrode current, positive values of i depolarize
the cell and in the presence of the extracellular mechanism there will be a
change in vext since i is not a transmembrane current but a current injected
directly to the inside of the cell.
ENDCOMMENT

INDEPENDENT {t FROM 0 TO 1 WITH 1 (ms)}

NEURON {
	POINT_PROCESS MyIClamp
	RANGE delay,dur,amp,amp2,i
	ELECTRODE_CURRENT i
}
UNITS {
	(nA) = (nanoamp)
}

PARAMETER {
	delay  (ms)
	dur  (ms)	<0,1e9>
	amp  (nA)
	amp2 (nA)
}
ASSIGNED { i (nA) }

INITIAL {
	i = amp
}

BREAKPOINT {
	at_time(delay)
	at_time(delay+dur)

	if (t < delay + dur && t > delay) {
		i = amp +amp2
	}else{
		i = amp
	}
}
