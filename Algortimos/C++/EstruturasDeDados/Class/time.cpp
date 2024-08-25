#include <iostream>
#include "time.h"

using namespace std;

// Construtor da classe Time
Time::Time(int hour, int minute, int second) {
    this->hour = hour;
    this->minute = minute;
    this->second = second;
}

/*
    Getters
*/

int Time::getHour() const {
    return hour;
}

int Time::getMinute() const {
    return minute;
}

int Time::getSecond() const {
    return second;
}

/*
    Setters
*/

void Time::setHour(int hour) {
    this->hour = hour;
}

void Time::setMinute(int minute) {
    this->minute = minute;
}

void Time::setSecond(int second) {
    this->second = second;
}

void Time::print() const {
    cout << hour << ":" << minute << ":" << second << endl;
}

void Time::nextSecond() {
    second += 1;
    if (second >= 60) {
        second = 0;
        minute += 1;
    }

    if (minute >= 60) {
        minute = 0;
        hour += 1;
    }

    if (hour >= 24) {
        hour = 0;
    }
}

