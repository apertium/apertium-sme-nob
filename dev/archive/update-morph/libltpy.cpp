#include "libltpy.hpp"
#include <lttoolbox/fst_processor.h>
#include <lttoolbox/lt_locale.h>

#ifdef GCC_VISIBILITY
#define EXTERN extern "C" __attribute__ ((visibility("default")))
#else
#define EXTERN extern "C"
#endif

using namespace std;

Analyser::Analyser(const string & analyserpath) throw(exception) {
	FILE * file = fopen(analyserpath.c_str(), "r");
	if (!file) {
		cerr << "Couldn't open analyser file " << analyserpath << endl;
		throw exception();
	}
	fst.load(file);
	fclose(file);
	fst.setCaseSensitiveMode(false);
	fst.setDictionaryCaseMode(true);
	fst.initBiltrans();
}
    
wstring Analyser::analyse(wstring const &word) {
	pair <wstring,int> analysis = fst.biltransWithQueue(word, false);
	if (analysis.second != 0) {
		return L"@"+word;
	}
	else {
		return analysis.first;
 	}
}

EXTERN wstring * analyse(Analyser * a, const wchar_t * word) {
	size_t wlen = wcslen(word);
	if (wlen == 0) {
		return 0;
	}
	wstring inputString = L"";
	for (size_t i = 0; i < wlen; i++) {
		inputString.append(1, word[i]);
	}
	wstring * out = new wstring(a->analyse(inputString));
	return out;
}

EXTERN void free_analyses(wstring * analyses) {
	delete analyses;
}


EXTERN Analyser * init(const char ** error, const char * path) {
	LtLocale::tryToSetLocale();
	Analyser * a = 0;
	try {
		a = new Analyser(path);
		
	}
	catch (exception & e) {
		delete a;
		a = 0;
		*error = e.what();
		return 0;
	}
	*error = 0;
	return a;
}

EXTERN void terminate(Analyser * a) {
	delete a;
}
