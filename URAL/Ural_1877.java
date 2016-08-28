import java.io.*;

public class Ural_1877 {
    static BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
    public static void main(String[] args) throws Exception {
        int a, b;
        a = Integer.parseInt(in.readLine());
        b = Integer.parseInt(in.readLine());
        if (a % 2 == 0 || b % 2 == 1)
            System.out.println("yes");
        else
            System.out.println("no");
    }
}
