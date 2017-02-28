import java.applet.Applet;
import java.awt.*;

public class Binary extends Applet
{

    public Binary()
    {
        range = 0;
    }

    public void ConvertInt(TextField textfield, Choice choice, int i)
    {
        int j = choice.getSelectedIndex();
        String s = textfield.getText();
        int k = 0;
        k = Integer.parseInt(s, BASES[i]);
        textfield.setText(Integer.toString(ConformToRange(k), BASES[j]));
    }

    public String Add(String s, int i, String s1, int j, int k)
    {
        int l = Integer.parseInt(s, BASES[i]);
        int i1 = Integer.parseInt(s1, BASES[j]);
        int j1 = (l + i1 + MAX_INT[0]) % MAX_INT[0];
        return Integer.toString(ConformToRange(j1), BASES[k]);
    }

    public String Sub(String s, int i, String s1, int j, int k)
    {
        int l = Integer.parseInt(s, BASES[i]);
        int i1 = Integer.parseInt(s1, BASES[j]);
        int j1 = ((l - i1) + MAX_INT[0]) % MAX_INT[0];
        return Integer.toString(ConformToRange(j1), BASES[k]);
    }

    public int ConformToRange(int i)
    {
        i = (i + MAX_INT[0]) % MAX_INT[0];
        if(i > MAX_INT[1] && range == 1)
            i -= MAX_INT[0];
        return i;
    }

    public void ConformToRangeAll()
    {
        int i = BASES[choiceA.getSelectedIndex()];
        int j = Integer.parseInt(textA.getText(), i);
        textA.setText(Integer.toString(ConformToRange(j), i));
        i = BASES[choiceB.getSelectedIndex()];
        j = Integer.parseInt(textB.getText(), i);
        textB.setText(Integer.toString(ConformToRange(j), i));
        i = BASES[choiceC.getSelectedIndex()];
        j = Integer.parseInt(textC.getText(), i);
        textC.setText(Integer.toString(ConformToRange(j), i));
    }

    public boolean isValidNum(String s, int i)
    {
        double d = 0.0D;
        boolean flag = false;
        try
        {
            d = Integer.parseInt(s, BASES[i]);
        }
        catch(NumberFormatException numberformatexception)
        {
            d = 0.0D;
            flag = true;
        }
        if(flag)
            return false;
        return d <= (double)MAX_INT[range] && d >= (double)MIN_INT[range];
    }

    public void init()
    {
        CheckBoxGroup = new CheckboxGroup();
        rangePos = new Checkbox("Pos", CheckBoxGroup, true);
        rangeNeg = new Checkbox("Full", CheckBoxGroup, false);
        validA = validB = validC = true;
        setLayout(new GridLayout(3, 2, 5, 5));
        textA = new TextField("0");
        textB = new TextField("0");
        textC = new TextField("0");
        choiceA = new Choice();
        choiceB = new Choice();
        choiceC = new Choice();
        invA = new Button("A'");
        invB = new Button("B'");
        invC = new Button("C'");
        inv2A = new Button("2s comp");
        inv2B = new Button("2s comp");
        inv2C = new Button("2s comp");
        addAB = new Button("A+B");
        subAB = new Button("A-B");
        textA.setFont(new Font("MonoSpaced", 0, 12));
        textB.setFont(new Font("MonoSpaced", 0, 12));
        textC.setFont(new Font("MonoSpaced", 0, 12));

        choiceA.add("Bin");
        choiceA.add("Oct");
        choiceA.add("Dec");
        choiceA.add("Hex");
        choiceB.add("Bin");
        choiceB.add("Oct");
        choiceB.add("Dec");
        choiceB.add("Hex");
        choiceC.add("Bin");
        choiceC.add("Oct");
        choiceC.add("Dec");
        choiceC.add("Hex");

        Panel panel = new Panel(new BorderLayout());
        Label label = new Label("A = ");
        label.setFont(new Font("MonoSpaced", 0, 12));
        panel.add(label, "West");
        panel.add(textA, "Center");
        Panel panel1 = new Panel(new GridLayout(1, 5));
        panel1.add(choiceA);
        panel1.add(invA);
        panel1.add(inv2A);
        panel1.add(new Label("Range:"));
        panel1.add(rangePos);
        add(panel);
        add(panel1);
        panel = new Panel(new BorderLayout());
        label = new Label("B = ");
        label.setFont(new Font("MonoSpaced", 0, 12));
        panel.add(label, "West");
        panel.add(textB, "Center");
        panel1 = new Panel(new GridLayout(1, 5));
        panel1.add(choiceB);
        panel1.add(invB);
        panel1.add(inv2B);
        panel1.add(new Label(" "));
        panel1.add(rangeNeg);
        add(panel);
        add(panel1);
        panel = new Panel(new BorderLayout());
        label = new Label("C = ");
        label.setFont(new Font("MonoSpaced", 0, 12));
        panel.add(label, "West");
        panel.add(textC, "Center");
        panel1 = new Panel(new GridLayout(1, 5));
        panel1.add(choiceC);
        panel1.add(invC);
        panel1.add(inv2C);
        panel1.add(addAB);
        panel1.add(subAB);
        add(panel);
        add(panel1);
        a = b = c = 0;
    }

    public int range;
    final int MAX_INT[] = {
        0x1000000, 0x7fffff
    };
    final int MIN_INT[] = {
        0, 0xff800000
    };
    final int BASES[] = {
        2, 8, 10, 16
    };
    public Checkbox rangePos;
    public Checkbox rangeNeg;
    public CheckboxGroup CheckBoxGroup;
    public int a;
    public int b;
    public int c;
    public boolean validA;
    public boolean validB;
    public boolean validC;
    public int oldChoiceA;
    public int oldChoiceB;
    public int oldChoiceC;
    public TextField textA;
    public TextField textB;
    public TextField textC;
    public Choice choiceA;
    public Choice choiceB;
    public Choice choiceC;
    public Button invA;
    public Button invB;
    public Button invC;
    public Button inv2A;
    public Button inv2B;
    public Button inv2C;
    public Button addAB;
    public Button subAB;
}
