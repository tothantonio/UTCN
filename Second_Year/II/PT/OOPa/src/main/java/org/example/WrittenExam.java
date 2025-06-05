package org.example;

import java.time.LocalDate;
import java.util.Date;

public final class WrittenExam extends ExamSession{

    public WrittenExam(int duration, String subject, LocalDate dateTime){
        super(duration, subject, dateTime);
    }
}
