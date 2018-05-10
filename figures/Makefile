PICTURES = visibility_visibility_100kev.pgf images_S00052.pgf

all: $(PICTURES)

visibility_visibility_100kev.pgf: visibility_100kev.hdf5 plot_visibility_pgf.py
	python plot_visibility_pgf.py --language en --steps 25 --pixel 510 $<

images_S00052.pgf: S00052.hdf5 plot_images.py
	python plot_images.py $< 6 --language en
