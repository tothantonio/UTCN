public class ImpachetareDespachetare {
    public static void main(String[] args) {
        int varsta = 8, sex = 1, inaltime = 175;

        int info_impachetata = (short)((((varsta << 1) | sex) << 8) | inaltime);

        System.out.println(info_impachetata);

        inaltime = info_impachetata & 0xff;
        sex = (info_impachetata >>> 8) & 1;
        varsta = (info_impachetata >>> 9) & 0x7f;

        System.out.println(varsta);
        System.out.println(sex);
        System.out.println(inaltime);
    }
}
