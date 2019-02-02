function [y1,xf1,af5] = simulate_noe_matrix(x1,xi1,ai5)
%SIMULATE_NOE_MATRIX neural network simulation function.
%
% Auto-generated by MATLAB, 02-Feb-2019 12:39:38.
% 
% [y1,xf1,af5] = simulate_noe_matrix(x1,xi1,ai5) takes these arguments:
%   x1 = 1xTS matrix, input #1
%   xi1 = 1x5 matrix, initial 5 delay states for input #1.
%   ai1 = 10x5 matrix, initial 5 delay states for layer #1.
%   ai2 = 10x5 matrix, initial 5 delay states for layer #2.
%   ai3 = 10x5 matrix, initial 5 delay states for layer #3.
%   ai4 = 10x5 matrix, initial 5 delay states for layer #4.
%   ai5 = 1x5 matrix, initial 5 delay states for layer #5.
% and returns:
%   y1 = 1xTS matrix, output #1
%   xf1 = 1x5 matrix, final 5 delay states for input #1.
%   af1 = 10x5 matrix, final 5 delay states for layer #1.
%   af2 = 10x5 matrix, final 5 delay states for layer #2.
%   af3 = 10x5 matrix, final 5 delay states for layer #3.
%   af4 = 10x5 matrix, final 5 delay states for layer #4.
%   af5 = 1x5 matrix, final 5 delay states for layer #5.
% where TS is the number of timesteps.

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = -4.93752318466583;
x1_step1.gain = 0.210435868804998;
x1_step1.ymin = -1;

% Layer 1
b1 = [1.8420085065380951139;-1.6317189923451882461;-0.78080933606115199286;-0.90957261639388164998;0.050996811525047675007;0.29693279337522571204;0.7666941032168380632;0.9567362189013431939;1.5402520467581024555;-1.8537521132238807819];
IW1_1 = [-0.78041545804284273569 -0.18891680571589372639 0.62420375558643170777 0.38254385586967643018 0.11132858481816297613;-0.26207884808871162452 0.063671815220867969409 0.067977955777468998533 0.46947126243700637582 0.19687224636127226285;-0.061050868428118146292 0.43620350083376657757 0.47572448928439503568 -0.33295062575163741903 -0.18496105182753019847;0.14082342231104258423 -0.1320546536601273635 -0.49393133970375574515 -0.21262832558695685115 -0.1240714048767716654;0.47609173433244711404 -0.63150999375165917105 -0.51556481524521968751 -0.14656247583550174873 0.21650179290340268445;-0.32444800738235041182 -0.1660024516012676421 0.29722105595493769625 0.38097507164648808375 -0.23338602584592743616;0.14710137939784087568 -0.039050046429146945126 0.441337535111876067 0.14890523455010193365 0.012579273070399840662;-0.1165330960975163449 0.37788917966792529013 0.22002429206493623326 -0.076830358922701444402 0.46213211122016462085;0.11550266997215274944 0.38738337558138807859 -0.62457516979531668699 -0.074478710135186920738 0.83112863904779332724;0.065843477446387979612 -0.14742080631494014487 -0.44942955374074095021 -0.1053773362299161992 0.57322556196782226134];
LW1_5 = [-0.21140572126062279201 0.98342014952366696434 0.07831843378941849565 0.62573603116239862043 -0.46069728906897888798;0.27591480794497580398 -0.42325449718057639448 -0.15327785792576290036 -0.48201094629439916739 -0.66421685042265066201;-0.39535090783148596483 0.0030548046006235456303 -0.38175471321469151009 -0.1373711817362839871 -0.54520998452879265717;-0.85537959523864859346 -0.0034984866692525781393 0.22952568288627378523 -0.69954557852212229108 0.0037807601132635810029;-0.6704540284077300516 -0.13568542287543042257 -0.66839479232986986901 0.44352275149486819483 0.12691453970784252747;-0.1533835129922414553 -0.15828626617631305629 -0.24207456374844618652 -0.57412822612013547641 -0.60140197031635145297;0.1779458190130129569 0.79003871229958788636 0.43920108769734933496 0.51372629645238532259 0.2078732017274463606;-0.29114437230780498833 -0.76870570906589286153 0.15070417629174873153 -0.31691048717575331928 0.47511975552798973998;0.58882688215316736358 -0.10413231615864219914 0.16252337571316655129 0.24931725414045602385 -1.0104188868762673525;0.64056145534157327148 0.60056572379935202477 0.21565820587068551539 0.69438979865556471616 -0.60339661147887768688];

% Layer 2
b2 = [1.7856478998898819288;-1.3632022804269361416;1.1308291989835830282;0.53434844299638095677;0.28907065983718099877;-0.25024607881625193784;0.5800212655911684001;0.93164667885720453544;1.2906215252464252607;1.7822198947658072221];
LW2_1 = [-0.75146174187725689464 0.014023016354718866386 0.32644279220384114781 0.90660022935466921812 -0.40795232917434315345 0.60960157875140685846 -0.25562162639988877944 0.10066722871003118411 0.64998266078069499851 0.093851252228563636359;0.56213951165120590314 -0.40896438246015787144 -0.27375739718159247671 -0.31034978607113394844 0.28087922385099378664 0.89661471211202348197 -0.3401174655151373849 -0.24974683152370263928 0.57222483119146838604 0.85463853281607682355;-0.70409224008847426379 0.437857221912158312 0.38790865018221415417 -0.31331056453942091045 0.59663510415702192269 0.25544146338399542628 0.18012705079664079189 -0.19245158383280228098 1.031375658617818436 -0.2004747683477036968;-0.46261552944577744029 -0.60833032459553293414 0.38156346567754401145 0.80056607469864016213 0.11481765110590130829 -0.31942984216014080889 -0.30812618234785404958 -0.80672420203422090523 -0.70754423675714273045 0.35395739081732086051;-0.72268074492281775267 -0.80994259730586137813 -0.48012472297759967166 -0.37421630843624892337 0.32503796485929414839 0.6499760510715775208 0.10203320467318535703 -0.51431091597126921133 0.21334978960932304837 -0.19188541487765059523;-0.62975029324568909672 -0.66644903841917801923 -0.27932720378867786915 -0.44068914609010517713 0.30977155251539983949 0.46090308549311714836 -0.22998472818172943644 0.077097467907169411894 -0.17438577969299726145 -0.79638649306433484387;0.62063753390611831051 0.83539867376766940854 0.27920936398507711917 0.77520216307019107482 -0.52686260303715248821 -0.072403514346486785858 -0.05991633433839561873 0.59028104938044201333 -0.57031874551041517041 -0.29771710069259610387;0.27060758154395336827 0.60871513503416840862 0.55085779675167356739 -0.51104733314616945794 0.076564816794596465832 0.55887912740008005574 -0.37549430899164482067 -0.79173695127485443912 0.087285491333024364802 0.52078392103359782972;0.38483774356107031123 -0.65129674185177810486 0.21637676411884210204 -0.45581257612714648486 -0.91015595086147105253 -0.79631028649259560925 -0.2739433435906923342 0.69205197005795648924 0.17482696538883693571 -0.21233891222594888926;0.34658114524894084729 -0.1019875969173149044 -0.1999883376645444355 -0.089755614363306479575 -0.19440717254884459786 -0.85381325420413056726 -0.57795138239333410102 -0.75194724899415821273 -0.56837030566837376533 -0.86428952174772832873];

% Layer 3
b3 = [-1.7638228629634251643;1.4037365686531324549;-1.000708673465326326;-0.45669651195092714202;-0.19250838502011466402;0.30164519788435339986;-0.62086005409104561004;-0.96445118300318166682;1.5436508687514021165;1.7669298360511358492];
LW3_2 = [0.040413860274551162421 -0.92239070048541682567 -0.28477049158364109438 -0.11937503911078289898 -0.34143908397271277577 -0.50733485064919781049 0.82006163207207372068 -0.50398360943505471354 -0.5781812335042627593 -0.64161556160537447369;-0.24791926807830771962 0.9443612492542389214 0.92705432767093776114 -0.39223986006012395711 -0.28425051274919932442 0.48204359503293897626 0.055639342668838687178 -0.5966492015674051963 0.30360672151137746422 0.55585618915527390538;0.79883728844232337885 0.1026440729171498728 -0.30225989466886293844 1.2863975237972837817 0.55547353843613223034 0.25888373401043368593 -0.60181713163786887399 0.1550257311622929568 0.10342832612294228234 0.076893282778382893161;0.18774217424961001099 0.073772548326666242957 0.98389896042601099335 0.15875671779180247634 -0.68414865746699071725 0.90332478490211898237 0.062693192173186945704 -0.047387286905901500333 -0.70188671203960262268 -0.40989642055882363758;0.34567979903814627374 0.16897452270714460876 -0.65511477638029180781 -0.067991061515179654351 0.94811307052564597342 0.17434245159570094241 0.39963453337968773971 0.23006593569810257494 -0.93213216556273181812 0.83027460339405112499;0.6414801731784182115 0.37126690277953011687 -0.54654195876076572258 -0.63143292696746367021 -0.69913434240755389926 0.70557959923069846209 0.0073331679289582599526 -0.50186739748874198419 0.55958009243862538717 0.46337341811851634477;-0.37697519029768700172 0.74558407385953240354 0.82763245776990423952 -0.35194635190589090845 -0.054512753614597987684 0.10420607619420149681 -0.32202939292067989108 0.7429852627776808438 0.47871007165085233126 0.6550844011835431635;-0.72488137593605417308 -0.22422875899415756207 -0.8789916337630017118 -0.34410970441512434004 -0.79603104830405913006 -0.28685401288189849023 0.59767370798619934291 0.20447337406256610448 -0.12496619004476315629 -0.7297744720950047892;0.73555960490337390922 -0.61561420101332864352 0.63945812650363631491 0.39810918430234931709 0.45761704785750267899 -0.014108869828494697771 0.46492940937154131342 -0.06551235997973642311 -0.63074968859026470103 -0.51513368032971418309;0.34636693523342304557 0.57982113783220901038 0.57340249697952316854 -0.63663622611961334652 0.49305704729815369447 -0.61295474090280033241 -0.30768781222107027817 0.8899680606405944161 0.2181278433946987616 0.59458230073932361037];

% Layer 4
b4 = [-1.7370551326144889615;-1.3005038430803881333;-0.99420673980957974258;0.52099365259874674816;-0.13341810709417700753;0.19606898832429542345;0.59537718387321236779;0.96989881609432071485;-1.3610896318912146796;1.7294423151791016302];
LW4_3 = [0.40870539709809461382 -0.25408886916271256062 -0.57666466027429830188 -0.80617111640670457984 -0.30950258765048466181 0.012320559508333968693 0.91501847459988361333 0.046476927022480130081 -0.7870969663017856055 0.22993344246229704964;0.54178725494151236397 0.26188639563861493276 -1.0605941953462667549 -0.048002513012465684861 -0.17809022179461977964 0.054981556481401593073 -0.81666236417747395393 0.38904090476776287399 -0.93938629378467686237 0.24049926258863651984;0.00093934403368494279879 0.84524127369610091431 -0.39411746914665957142 1.0034068425839268723 0.23175304991356204809 -0.51925501170317134303 -0.20888721130970661077 0.28539820305701379954 0.77759269305989831 0.38177987229098048205;-0.067912099676715645402 0.66430400356172680798 -0.25316358100225777594 -0.35170264729292538552 0.87479107515515075466 -0.94018974009686306914 0.79509142551266309695 0.21038089771127216343 -0.52965427383844665421 0.22205390222147161627;0.17672589877127811708 0.91630858276520676942 0.20075430730895135745 0.15498044558932866366 -0.16833067012519342676 -0.84826572881355699618 0.29311118921427725681 -0.20264528265917858274 -1.0105700413936196114 -0.082913564580340035071;0.54328328957335891847 0.69160825195387287678 0.60786415520838388282 0.25679773545168027571 -0.054190034319975328991 0.62383595619459630832 0.81508785066547806419 -0.45377732765484085631 0.56547815556141733939 -0.59386515050746635502;0.41692266686929574382 0.79366518187884260715 -0.48488312806495753593 -0.11640252719413282656 0.6113968684917006069 -0.66721431902438299577 -0.044172263035992830049 -0.18670291558445498148 -0.88087186787475157956 0.63456291886210280939;0.04448798509360522152 -0.8464129571423535392 -0.10913072854795903555 -0.15479820465780388949 -0.1417084793712377333 0.56890934011240124057 -0.85969885445430749282 -0.82347580793998353954 0.64619184530852680215 -0.44575403986323774985;-0.3625333285295555541 -0.86417254264218901216 0.61938491178412935501 0.79094265482623649088 0.63959137502408525133 0.38226953726844054016 0.22015855802183606493 0.18243920697424145794 -0.70387644815780425755 0.27393026557719812875;0.39184120557124829665 -0.77287431052964972178 -0.22186604545615715156 -0.9501743690746662363 -0.13142319458740961413 0.57596975917214843221 -0.50019731440796999511 0.83549667014445438973 -0.26668495287948840167 0.60316473971497963635];

% Layer 5
b5 = 0.03334524464229252777;
LW5_4 = [-0.59931865601393830012 1.1522015654827768572 -1.0480100643579932651 0.58881859876025410827 0.8131457243557310699 -0.9050448467599009339 0.070078109553445760982 0.70127626698280942641 -0.20729056877241042178 0.62453079569397573767];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 4.03000185560612;
y1_step1.xoffset = -0.018676052749131;

% ===== SIMULATION ========

% Dimensions
TS = size(x1,2); % timesteps

% Input 1 Delay States
xd1 = mapminmax_apply(xi1,x1_step1);
xd1 = [xd1 zeros(1,1)];

% Layer Delay States
ad5 = [ai5 zeros(1,1)];

% Allocate Outputs
y1 = zeros(1,TS);

% Time loop
for ts=1:TS

      % Rotating delay state position
      xdts = mod(ts+4,6)+1;
      adts = mod(ts+4,6)+1;
    
    % Input 1
    xd1(:,xdts) = mapminmax_apply(x1(:,ts),x1_step1);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2 3 4 5]-1,6)+1),5,1);
    tapdelay2 = reshape(ad5(:,mod(adts-[1 2 3 4 5]-1,6)+1),5,1);
    a1 = tansig_apply(b1 + IW1_1*tapdelay1 + LW1_5*tapdelay2);
    
    % Layer 2
    a2 = tansig_apply(b2 + LW2_1*a1);
    
    % Layer 3
    a3 = tansig_apply(b3 + LW3_2*a2);
    
    % Layer 4
    a4 = tansig_apply(b4 + LW4_3*a3);
    
    % Layer 5
    ad5(:,adts) = b5 + LW5_4*a4;
    
    % Output 1
    y1(:,ts) = mapminmax_reverse(ad5(:,adts),y1_step1);
end

% Final delay states
finalxts = TS+(1: 5);
xits = finalxts(finalxts<=5);
xts = finalxts(finalxts>5)-5;
finalats = TS+(1:5);
ats = mod(finalats-1,6)+1;
xf1 = [xi1(:,xits) x1(:,xts)];
af5 = ad5(:,ats);
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end