package org.example;

import java.time.LocalDate;
import java.util.Date;

public final class OralExam extends ExamSession{

    public OralExam(int duration, String subject, LocalDate dateTime){
        super(duration, subject, dateTime);
    }
}
