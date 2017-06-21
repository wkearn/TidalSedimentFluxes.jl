using DischargeData, TidalSedimentFluxes, TidalFluxCalibrations, Base.Dates
using Base.Test

obs1 = OBS3("T8271",[0.0741962;0.0456691;1.40e-6],250,[-0.1695174;0.1828727;2.30e-5],1000)

ts = collect(now():Minute(10):(999*Minute(10)+now()))

N = length(ts)

r = rand(1:1250,N)
a1 = AnalogLow(ts,4*r)
a2 = AnalogHigh(ts,r)

T1 = Turbidity(a1,obs1)
T2 = Turbidity(a2,obs1)

tsc = ts[1:10:N]
qc = quantity(T2)[1:10:N]
M = length(tsc)

tss1 = TSS(tsc,2*qc+1+randn(M))

c = Calibration(tss1,T2)
m = fit(PolynomialCalibrationModel,c,1)
tss2 = TSS(T1,m)
