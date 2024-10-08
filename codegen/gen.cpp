#define WIN32_LEAN_AND_MEAN // Exclude rarely-used stuff from Windows headers
#include <stdio.h>
#include <stdlib.h>
#include <lwo2.h>
#include <iostream>
#include <fstream>
#include <filesystem>
#include <map>
using namespace std;
using namespace std::filesystem;

#define test_proc_begin() out << endl << "@(test)" << endl << __func__ << " :: proc(t: ^testing.T) {" << endl
#define test_proc_end() out << "}" << endl
#define test_proc_using(name) out << '\t' << "using " << name << endl
#define test_proc_comment(comment) out << '\t' << "// " << comment << endl

#define expect_size(s)out << '\t' << "expect_size(t, lw." << #s << ", " << sizeof(s) << ")" << endl
#define expect_value(s)out << '\t' << "expect_value(t, lw." << #s << ", " << "0x" << std::uppercase << std::setfill('0') << std::setw(8) << std::hex << s << ")" << endl

void verify_struct_sizes(ofstream& out) {
    test_proc_begin();
    test_proc_using("ot");

    expect_size(lwNode);
    expect_size(lwPlugin);
    expect_size(lwKey);
    expect_size(lwEnvelope);
    expect_size(lwEParam);
    expect_size(lwVParam);
    expect_size(lwClipStill);
    expect_size(lwClipSeq);
    expect_size(lwClipAnim);
    expect_size(lwClipXRef);
    expect_size(lwClipCycle);
    expect_size(lwClip);
    expect_size(lwTMap);
    expect_size(lwImageMap);
    expect_size(lwProcedural);
    expect_size(lwGradKey);
    expect_size(lwGradient);
    expect_size(lwTexture);
    expect_size(lwTParam);
    expect_size(lwCParam);
    expect_size(Glow);
    expect_size(lwRMap);
    expect_size(lwLine);
    expect_size(lwSurface);
    expect_size(lwVMap);
    expect_size(lwVMapPt);
    expect_size(lwPoint);
    expect_size(lwPolVert);
    expect_size(lwPolygon);
    expect_size(lwPointList);
    expect_size(lwPolygonList);
    expect_size(lwLayer);
    expect_size(lwTagList);
    expect_size(lwObject);

    test_proc_end();
}

void test_lightwave(ofstream& out) {
    out << "package " << __func__
        << " // generated by " << path(__FILE__).filename().replace_extension("").string() << endl
        << endl;

    out << "import \"core:testing\"" << endl
        << "import ot \"shared:ounit\"" << endl
        << "import lw \"..\"" << endl;

    verify_struct_sizes(out);
}

int main(int argc, char* argv[]) {
    if (argc < 2) { cout << "Usage: " << path(argv[0]).filename().string() << " <odin-output-file>" << endl; return -1; }
    auto filepath = path(argv[1]);
    cout << "Writing " << filepath.string() << endl;
    ofstream out(filepath);
    test_lightwave(out);
    out.close();
}
