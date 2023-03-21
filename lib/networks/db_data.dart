/// Main Categories
const String malti = 'Malti';
const String coding = 'Coding';
const String sequience = 'Sequience';
const String chain = 'Chain';

/// Subcategories Malti
const String sareeDaman = 'Saree Daman';
const String sutDamanAndDupata = 'Sut Daman & Dupta';
const String galaNackAndServani = 'Sut Daman & DServani';
const String butaAndPech = 'Buta & Pech';
const String cPallu = 'C Pallu';
const String garmentAndJal = 'Garment & Jal';
const String lace = 'Lace';

/// Subcategories Coding
const String lenghaKli = 'Lengha-Kli';
const String daman = 'Daman';
const String figarDesign = 'FigarDesign';
const String blouse = 'Blouse';
const String choli = 'Choli';

/// Subcategories Sequience
const String lomgKli = 'Long Kli';
const String gala = 'Gala';
const String sut = 'Sut';
const String butiSmall = 'Buti Small';

/// Subcategories Chain
const String penalPatta = 'Penal Patta';
const String noPanching = 'No Panching';

List<String> categories = [malti, coding, sequience, chain];

Map subcategories = {
  malti: [sareeDaman, butaAndPech, cPallu, garmentAndJal, lace],
  coding: [lenghaKli, daman, figarDesign, blouse, choli],
  sequience: [lomgKli, gala, sut, butiSmall],
  chain: [penalPatta, noPanching]
};
