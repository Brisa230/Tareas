s.boot;

// SynthDef
(
SynthDef(\misinte, {|frec=479, amp=0.2|
	var sen, env;
	sen=SinOsc.ar(frec, 0, amp);
	env=EnvGen.kr(Env.new([0,1,0],[0.2,0.5]),doneAction:2);
	Out.ar(0, sen*env)
}).add
);

// Llamar a un SynthDef
a=Synth(\misinte,[\frec, rrand(270,367)]);

(
~sec1=Pdef(\sec,
	Pbind(\instrument, \misinte,
		\dur, Pseq([0.75, 0.57, 0.97], inf),
		\frec, Pseq([270, 367, 467],inf),
		\amp, 1
	)
);
)

~sec1.play;
~sec1.stop;