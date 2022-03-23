// purpose is to filter data

#include <iostream>
#include <string>
#include <fstream>

std::string formatToStringLiteral(const std::string &st) {
    return "\"" + st + "\"";
}

void filterByLength(int len, std::string saveFile) {
    std::ifstream fin;
    std::ofstream fout;
    fout.open(saveFile.c_str());
    fin.open("google-10000-english-usa-no-swears-medium.txt");
    if (!fin.is_open()) {
        std::cout << "Error opening input file" << std::endl;
        return;
    }
    if (!fout.is_open()) {
        std::cout << "Error opening output file" << std::endl;
        return;
    }

    std::string readWord; // read as in past tense
    fin >> readWord; // write the first string

    fout << "[\n";
    // loop to find the first instance of a string with n length
    // purpose is to write without comma
    while (fin >> readWord) {
        if (readWord.length() == len) {
            fout << "\t" << formatToStringLiteral(readWord);
            break; // end this to process additional strings
        }
    }

    // while loop to write additional strings into the array without trailing commas
    while (fin >> readWord) {
        if (readWord.length() == len) {
            fout << ",\n\t" << formatToStringLiteral(readWord);
        }
    }
    fout << "\n]";
    fin.close();
    fout.close();
}

int main() {
    std::string saveFile = "words-five-len.json";
    filterByLength(5, saveFile);
}