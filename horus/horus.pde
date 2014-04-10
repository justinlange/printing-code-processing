// Substitution rule:
// http://tilings.math.uni-bielefeld.de/substitution_rules/t2000

float factor = sqrt(3);
int maxLevel = 0;
int startSize = 0;


void setup(){

size(1280,800);
background(255);
smooth();

  startSize = 5000;
  maxLevel = 10;
  translate(width / 2, -500);


drawEye(0, 0, startSize, 0, 0, false);

}

void drawEye(float x, float y, float bottomSize, float rot, int level, boolean drawSingle){
  float b = bottomSize / 2;
  float c = bottomSize / factor;
  float a = sqrt(sq(c) - sq(b)); // a2 + b2 = c2

  pushMatrix();
  translate(x, y);
  rotate(radians(rot));
  drawAllShapes();
  
    if(drawSingle && level < maxLevel)
    {
    level++;
    drawEye(bottomSize, 0, level);
    }
    else if(level < maxLevel)
    {
    level++;
    
    drawEye(-(a / factor), a, c, 150, level,false);
    drawEye(a / factor, a, c, -150, level,false);
    
    float childBottom = c / factor;
    float childB = childBottom / 2;
    float childC = childBottom / factor;
    float childA = sqrt(sq(childC) - sq(childB)); // a2 + b2 = c2

    drawEye(0, a - childA, childBottom, 0, level, true);
    drawEye(0, a - childA, childBottom, 120, level, true);
    drawEye(0, a - childA, childBottom, -120, level, true);

}

void drawAllShapes(){
  
  
fill(0);
stroke(0,0,0);


stroke(254,254,254);
beginShape();
vertex(0,226);
bezierVertex(14,210,28,194,42,178);
bezierVertex(52,167,60,155,69,144);
bezierVertex(79,129,94,120,111,114);
bezierVertex(145,103,179,102,214,107);
bezierVertex(250,112,284,122,317,137);
bezierVertex(325,140,332,145,340,149);
bezierVertex(359,162,380,168,402,170);
bezierVertex(430,173,458,175,486,177);
bezierVertex(509,178,533,179,557,180);
bezierVertex(564,181,570,180,577,180);
bezierVertex(581,179,583,181,583,185);
bezierVertex(583,192,583,200,583,207);
bezierVertex(574,207,566,206,559,205);
bezierVertex(518,200,476,199,434,197);
bezierVertex(414,197,394,195,374,194);
bezierVertex(363,194,352,196,341,201);
bezierVertex(303,218,263,232,220,238);
bezierVertex(214,238,208,240,201,241);
bezierVertex(196,242,195,244,199,248);
bezierVertex(206,256,214,265,223,272);
bezierVertex(281,322,346,359,418,386);
bezierVertex(455,400,494,401,532,387);
bezierVertex(544,382,556,375,565,365);
bezierVertex(576,353,578,338,576,322);
bezierVertex(575,317,574,312,571,307);
bezierVertex(565,296,552,290,540,293);
bezierVertex(531,294,525,300,523,308);
bezierVertex(520,316,521,324,527,331);
bezierVertex(531,336,537,338,543,336);
bezierVertex(548,335,551,332,552,327);
bezierVertex(554,322,552,317,547,316);
bezierVertex(544,315,543,316,543,319);
bezierVertex(543,321,545,324,542,324);
bezierVertex(540,324,536,321,536,319);
bezierVertex(534,312,541,306,548,308);
bezierVertex(554,310,559,314,560,320);
bezierVertex(562,328,559,335,553,340);
bezierVertex(542,349,524,345,515,331);
bezierVertex(503,311,519,282,543,282);
bezierVertex(567,281,584,297,587,320);
bezierVertex(592,360,568,388,536,401);
bezierVertex(511,412,485,415,458,414);
bezierVertex(416,412,378,396,341,379);
bezierVertex(276,348,213,311,157,265);
bezierVertex(151,261,145,257,140,253);
bezierVertex(138,252,136,252,132,250);
bezierVertex(132,269,133,287,132,304);
bezierVertex(132,309,130,313,130,317);
bezierVertex(128,326,126,335,126,345);
bezierVertex(124,369,123,394,122,419);
bezierVertex(121,423,120,426,116,426);
bezierVertex(103,430,100,427,98,416);
bezierVertex(92,395,88,374,82,352);
bezierVertex(81,345,78,338,74,331);
bezierVertex(68,320,68,310,75,300);
bezierVertex(80,294,82,288,82,280);
bezierVertex(81,269,81,258,81,246);
bezierVertex(81,242,78,239,74,238);
bezierVertex(67,236,60,234,54,234);
bezierVertex(39,233,24,234,9,234);
bezierVertex(6,234,3,232,0,231);
bezierVertex(0,229,0,227,0,226);
endShape();


stroke(254,254,254);
beginShape();
vertex(247,137);
bezierVertex(256,166,250,195,226,216);
bezierVertex(226,216,227,217,227,216);
bezierVertex(246,214,265,210,283,204);
bezierVertex(299,198,315,191,326,177);
bezierVertex(328,175,329,173,327,171);
bezierVertex(322,167,318,163,313,160);
bezierVertex(293,148,271,142,247,137);
endShape();


stroke(254,254,254);
beginShape();
vertex(142,220);
bezierVertex(115,199,106,172,114,140);
bezierVertex(98,146,86,156,76,168);
bezierVertex(67,180,57,191,48,203);
bezierVertex(46,205,44,208,41,212);
bezierVertex(75,216,107,219,142,220);
endShape();


stroke(254,254,254);
beginShape();
vertex(216,0);
bezierVertex(224,0,232,1,240,2);
bezierVertex(271,5,302,8,330,20);
bezierVertex(348,27,365,35,383,42);
bezierVertex(408,52,432,62,457,71);
bezierVertex(478,78,500,81,522,82);
bezierVertex(541,84,560,85,579,85);
bezierVertex(583,86,585,87,586,90);
bezierVertex(586,93,587,97,587,100);
bezierVertex(588,104,587,106,582,106);
bezierVertex(567,105,552,106,537,105);
bezierVertex(511,103,485,100,459,96);
bezierVertex(433,92,408,82,384,72);
bezierVertex(362,63,340,54,318,45);
bezierVertex(296,36,273,33,250,31);
bezierVertex(229,29,208,29,188,28);
bezierVertex(145,28,104,37,64,51);
bezierVertex(51,55,39,61,26,66);
bezierVertex(20,68,14,66,10,60);
bezierVertex(7,54,7,49,14,45);
bezierVertex(26,38,39,31,52,25);
bezierVertex(77,15,103,7,130,3);
bezierVertex(141,2,151,1,162,1);
bezierVertex(165,0,169,0,173,0);
bezierVertex(187,0,201,0,216,0);
endShape();


fill(255);
stroke(0,0,0);
beginShape();
vertex(247,137);
bezierVertex(271,142,293,148,313,160);
bezierVertex(318,163,322,167,327,171);
bezierVertex(329,173,328,175,326,177);
bezierVertex(315,191,299,198,283,204);
bezierVertex(265,210,246,214,227,216);
bezierVertex(227,217,226,216,226,216);
bezierVertex(250,195,256,166,247,137);
endShape();

fill(255);
stroke(0,0,0);
beginShape();
vertex(142,220);
bezierVertex(107,219,75,216,41,212);
bezierVertex(44,208,46,205,48,203);
bezierVertex(57,191,67,180,76,168);
bezierVertex(86,156,98,146,114,140);
bezierVertex(106,172,115,199,142,220);
endShape();
}


