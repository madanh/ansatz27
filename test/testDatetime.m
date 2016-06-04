clear classes

dt1 = datetime(2013, 12, 1, 0, 0, 0, 'TimeZone', 'Europe/Berlin');
dt2 = datetime(2013, 12, 2, 0, 0, 0, 'TimeZone', 'Europe/Berlin');
dt3 = plus(dt1, 1);
assert(isequal(dt2, dt3))

dt1 = datetime(2013, 12, 1, 0, 0, 0, 'TimeZone', 'Europe/Berlin');
dt2 = datetime(2013, 12, 2, 12, 0, 0, 'TimeZone', 'Europe/Berlin');
dt3 = plus(dt1, 1.5);
assert(isequal(dt2, dt3))

dateStr = '2013-12-01';
dt = datetime(dateStr);
assert(char(dt), dateStr)
assert(datenum(dt), datenum(dateStr))


dt1 = datetime('2014-01-01T01:02+0100', 'TimeZone', 'Europe/Berlin', 'InputFormat', 'yyyy-MM-dd''T''HH:mmZ');
assert(char(dt1), '2014-01-01T01:02+0100')

dt2 = datetime('2014-01-01T02:02+0200', 'TimeZone', 'Europe/Berlin', 'InputFormat', 'yyyy-MM-dd''T''HH:mmZ');
assert(char(dt2), '2014-01-01T01:02+0100')
assert(isequal(dt1, dt2))

dt1 = datetime('2014-01-01T01:02Z', 'TimeZone', 'Europe/Berlin', 'InputFormat', 'yyyy-MM-dd''T''HH:mmXX');

try
    dt = datetime('2014-01-01T01:02Z', 'InputFormat', 'yyyy-MM-dd', 'TimeZone', '', 'Format', 'preserveinput');
catch e
    e
end
