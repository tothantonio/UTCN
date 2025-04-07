#include "clip.h"

namespace egc {

    enum outCode {
        INSIDE = 0,
        TOP = 8,
        BOTTOM = 4,
        LEFT = 1,
        RIGHT = 2,
    	TOP_RIGHT = 10,
    	TOP_LEFT = 9,
    	BOTTOM_RIGHT = 6,
    	BOTTOM_LEFT = 5
    };

	std::vector<int> computeCSCode(std::vector<vec3> clipWindow, const vec3 p) {
		std::vector<int> code(1, INSIDE);
		//TO DO - compute the code for the point given as argument

	    if (p.x < clipWindow[0].x)       // to the left
	        code[0] |= LEFT;
	    else if (p.x > clipWindow[1].x)  // to the right
	        code[0] |= RIGHT;
	    if (p.y < clipWindow[0].y)       // below
	        code[0] |= BOTTOM;
	    else if (p.y > clipWindow[2].y)  // above
	        code[0] |= TOP;
	    return code;
	}

	bool simpleRejection(std::vector<int> cod1, std::vector<int> cod2) {
		//TO DO - write the code to determine if the two input codes represent 
		//points in the SIMPLE REJECTION case
	    return (cod1[0] & cod2[0]) != 0;
	}

	bool simpleAcceptance(std::vector<int> cod1, std::vector<int> cod2) {
		//TO DO - write the code to determine if the two input codes represent 
		//points in the SIMPLE ACCEPTANCE case
	    return (cod1[0] | cod2[0]) == 0;
	}

	//function returns -1 if the line segment cannot be clipped
	int lineClip_CohenSutherland(std::vector<vec3> clipWindow, vec3& p1, vec3& p2) {
		//TO DO - implement the Cohen-Sutherland line clipping algorithm - consult the laboratory work
	    std::vector<int> cod1 = computeCSCode(clipWindow, p1);
	    std::vector<int> cod2 = computeCSCode(clipWindow, p2);

	    bool accept = false;

	    while (true) {
	        if (simpleAcceptance(cod1, cod2)) {
	            accept  = true;
	        	break;
	        } else if (simpleRejection(cod1, cod2)){
	        	return -1;
	        } else {
		        int codeOut = cod1[0] ? cod1[0]	: cod2[0];
	        	vec3 p;

	        	if (codeOut & TOP) {
	        		p.x = p1.x + (p2.x - p1.x) * (clipWindow[2].y - p1.y) / (p2.y - p1.y);
	        		p.y = clipWindow[2].y;
	        	}
	        	else if (codeOut & BOTTOM) {
	        		p.x = p1.x + (p2.x - p1.x) * (clipWindow[0].y - p1.y) / (p2.y - p1.y);
	        		p.y = clipWindow[0].y;
	        	}
	        	else if (codeOut & RIGHT) {
	        		p.y = p1.y + (p2.y - p1.y) * (clipWindow[1].x - p1.x) / (p2.x - p1.x);
            		p.x = clipWindow[1].x;
            	}
            	else if (codeOut & LEFT) {
            		p.y = p1.y + (p2.y - p1.y) * (clipWindow[0].x - p1.x) / (p2.x - p1.x);
            		p.x = clipWindow[0].x;
	        	}
	        	if (codeOut == cod1[0]) {
            		p1 = p;
            		cod1 = computeCSCode(clipWindow, p1);
            	} else {
            		p2 = p;
            		cod2 = computeCSCode(clipWindow, p2);
            	}
	        }
	    }
		return accept ? 0 : -1;
	}
}
