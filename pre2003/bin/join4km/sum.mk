#! /usr/bin/make -f

ifndef configure.mk
include ../configure.mk
endif

define daily

.PHONY: stats
stats:: ${loc}/$1/etc/sum/jPCP.csv ${loc}/$1/etc/hist/jPCP.csv

${loc}/$1/etc/sum/jPCP.csv ${loc}/$1/etc/hist/jPCP.csv:${loc}/$1/cellhd/jPCP
	@echo $1
	@[[ -d ${loc}/$1/etc/sum ]] || mkdir -p ${loc}/$1/etc/sum;\
	${MASK};\
	r.stats -1 -n jPCP@$1  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; END {printf "%d,%0.2f\n",$$$$cnt,$$$$sum; }' | sed -e "s/^/jPCP,$1,/" > ${loc}/$1/etc/sum/jPCP.csv;\
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	r.stats -1 -n jPCP@$1 | perl -a -n -e '$$$$n=sprintf("%d",$$$$F[0]/2); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%d,%d\n",$$$$_*2,$$$$hist{$$$$_};} }' | sed -e "s/^/jPCP,$1,/" > ${loc}/$1/etc/hist/jPCP.csv;

endef

$(foreach d,${days},$(eval $(call daily,${d})))

daily_sum_jPCP.csv: stats
	cat $(patsubst %,${loc}/%/etc/sum/jPCP.csv,${days}) > $@

daily_hist_jPCP.csv: stats
	cat $(patsubst %,${loc}/%/etc/hist/jPCP.csv,${days}) > $@

