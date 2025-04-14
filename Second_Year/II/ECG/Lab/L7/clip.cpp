#include "clip.h"

namespace egc {
	//Cyrus-Beck clipping algorithm
	//clipWindow specifies the vertices that define the clipping area in conterclockwise order
	//and can represent any convex polygon
	//function returns -1 if the line segment cannot be clipped
	int lineClip_CyrusBeck(std::vector<vec3> clipWindow, vec3& p1, vec3& p2) {
		//TO DO - implement the Cyrus-Beck line clipping algorithm - consult the laboratory wo
		float tE = 0.0f; // range ul
		float tL = 1.0f;
		std::vector <vec3> normals; // vector de normale pt fiecare muchie
		std::vector <vec3> pEi; // vector de puncte de intrare pt fiecare muchie

		vec3 edge  = vec3();

		for (int i = 0; i < clipWindow.size(); i++) {
			edge = clipWindow[i + 1] - clipWindow[i]; // vectorul de directie al muchiei
			normals.push_back(egc::crossProduct(edge, { 0.0f, 0.0f, 1.0f }));
			//normala se calculeaza facand produsul vectorial cu axa z
			//stocam punctul ca un pct pe muchie
			pEi.push_back(clipWindow[i]);
		}

		if (p1 == p2) { // can't clip a point ofc
			return -1;
		}

		for (int i = 0; i < clipWindow.size(); i++) {
			float ni_dot_d = egc::dotProduct(normals[i], (p2 - p1)); // dot product dintre normala si vectorul de directie
			float ni_dot_pei = egc::dotProduct(normals[i], (p1 - pEi[i])); // dot product dintre normala si vectorul de intrare

			if (ni_dot_d != 0) { // daca nu e paralela cu muchia
				float t = ni_dot_pei / (-ni_dot_d);

				if (ni_dot_d < 0) { // linia intra in poligon, actualizez maxi
					tE = std::max(tE, t);
				}
				if (ni_dot_d > 0) { // linia iese din poligon, actualizez min
					tL = std::min(tL, t);
				}
			}
		}

		if (tE > tL) { // daca linia e inafara poligonului
			return -1;
		} else { // calculez noile valori pt puncte
			vec3 new_pe = p1 + (p2 - p1) * tE;
			vec3 new_pl = p1 + (p2 - p1) * tL;
			p1 = new_pe;
			p2 = new_pl;
		}

		return 0;
	}
}