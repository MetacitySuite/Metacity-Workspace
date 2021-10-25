all: build
.PHONY: build upload clean deploy

#for manual deploy, update the version in setup.py
#commit the changes
#run make build and make upload, you'll need your pypi account

#to automate this, update the version number and run make deploy

#environments
react:
	@-( \
		cd react-metaworkspace; \
		npm run build; \
		cd ..; \
		rm -r metaworkspace/client/; \
		mkdir metaworkspace/client/; \
		cp -a react-metaworkspace/build/. metaworkspace/client/; \
	)

build: clean
	@-( \
		python setup.py sdist bdist_wheel \
	)

upload: 
	@-( \
		rm dist/metaworkspace*; \
		python setup.py sdist; \
		python -m twine upload dist/*; \
	)

deploy: clean
	@-( \
		python setup.py sdist bdist_wheel; \
		rm dist/metaworkspace*; \
		python setup.py sdist; \
		python -m twine upload dist/*; \
	)


push: clean
	@-( \
		git add setup.py; \
		git commit -m "Deploying to Pypi.org"; \
	)

clean:
	@-( \
		find . -type d -not -path "*/env/*" -wholename '*/build' -exec rm -r {} +;\
		find . -type f -not -path "*/env/*" -name '*.so' -exec rm {} +;\
	)

update:
	@pip install -r requirements.txt --upgrade

run:
	@python -m metaworkspace --run test