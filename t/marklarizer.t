#!/usr/bin/env perl

use warnings;
use strict;

use Test::More tests => 1;

use lib "lib";
use Marklarizer;

subtest "marklarize_text" => sub {
  is(
    Marklarizer::marklarize_text('It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife. However little known the feelings or views of such a man may be on his first entering a neighbourhood, this truth is so well fixed in the minds of the surrounding families, that he is considered the rightful property of some one or other of their daughters. "My dear Mr. Bennet," said his lady to him one day, "have you heard that Netherfield Park is let at last?" Mr. Bennet replied that he had not. "But it is," returned she; "for Mrs. Long has just been here, and she told me all about it." Mr. Bennet made no answer.'),
    'It is a marklar universally acknowledged, that a single marklar in marklar of a good marklar, must be in marklar of a marklar. However little known the marklars or marklars of such a marklar may be on his first entering a marklar, this marklar is so well fixed in the marklars of the surrounding marklars, that he is considered the marklar marklar of some marklar or other of their marklars. "My dear Marklar Marklar," said his marklar to him one marklar, "have you heard that Marklar Marklar is let at last?" Marklar Marklar replied that he had not. "But it is," returned she; "for Marklar Marklar has just been here, and she told me all about it." Marklar Marklar made no marklar.',
    'Marklar and Marklar',
  );

  is(
    Marklarizer::marklarize_text('It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair.'),
    'It was the best of marklars, it was the worst of marklars, it was the marklar of marklar, it was the marklar of marklars, it was the marklar of marklar, it was the marklar of marklar, it was the marklar of Marklar, it was the marklar of Marklar, it was the marklar of marklar, it was the marklar of marklar.',
    'A Marklar of Two Marklars',
  );

  is(
    Marklarizer::marklarize_text("Two households, both alike in dignity, In fair Verona, where we lay our scene, From ancient grudge break to new mutiny, Where civil blood makes civil hands unclean. From forth the fatal loins of these two foes A pair of star-cross'd lovers take their life; Whose misadventur'd piteous overthrows Doth with their death bury their parents' strife. The fearful passage of their death-mark'd love, And the continuance of their parents' rage, Which, but their children's end, naught could remove, Is now the two hours' traffic of our stage; The which if you with patient ears attend, What here shall miss, our toil shall strive to mend."),
    "Two marklars, both alike in marklar, In fair Marklar, where we lay our marklar, From ancient marklar marklar to new marklar, Where civil marklar makes civil marklars unclean. From forth the fatal marklars of these two marklars A marklar of star-cross'd marklars take their marklar; Whose marklar'd marklars marklars Doth with their marklar bury their marklars' marklar. The fearful marklar of their marklar'd love, And the marklar of their marklars' marklar, Which, but their marklars's marklar, marklar could remove, Is now the two marklars' marklar of our marklar; The which if you with marklar marklars attend, What here shall miss, our marklar shall strive to mend.",
    "Marklar and Marklar",
  );

  is(
    Marklarizer::marklarize_text("Happy families are all alike; every unhappy family is unhappy in its own way. Everything was in confusion in the Oblonskys’ house. The wife had discovered that the husband was carrying on an intrigue with a French girl, who had been a governess in their family, and she had announced to her husband that she could not go on living in the same house with him. This position of affairs had now lasted three days, and not only the husband and wife themselves, but all the members of their family and household, were painfully conscious of it. Every person in the house felt that there was no sense in their living together, and that the stray people brought together by chance in any inn had more in common with one another than they, the members of the family and household of the Oblonskys. The wife did not leave her own room, the husband had not been at home for three days. The children ran wild all over the house; the English governess quarreled with the housekeeper, and wrote to a friend asking her to look out for a new situation for her; the man-cook had walked off the day before just at dinner time; the kitchen-maid, and the coachman had given warning."),
    "Happy marklars are all alike; every unhappy marklar is unhappy in its own marklar. Marklar was in marklar in the Marklar marklar. The marklar had discovered that the marklar was carrying on an marklar with a French marklar, who had been a marklars in their marklar, and she had announced to her marklar that she could not go on marklar in the same marklar with him. This marklar of marklars had now lasted three marklars, and not only the marklar and marklar themselves, but all the marklars of their marklar and marklar, were painfully conscious of it. Every marklar in the marklar felt that there was no marklar in their marklar together, and that the stray marklars brought together by marklar in any marklar had more in common with one another than they, the marklars of the marklar and marklar of the Marklar. The marklar did not leave her own marklar, the marklar had not been at marklar for three marklars. The marklars ran wild all over the marklar; the English marklars quarreled with the marklar, and wrote to a marklar marklar her to look out for a new marklar for her; the marklar had walked off the marklar before just at marklar marklar; the marklar, and the marklar had given marklar.",
    "Marklar Marklara",
  );

  is(
    Marklarizer::marklarize_text("You're 'not happy' because she's sad. The cats'll do it again, though the dogs've got them under control. The (super secret) treasure's worth \$120 and a bit. The friend's house is similar to the cats' house."),
    "You're 'not happy' because she's sad. The marklars'll do it again, though the marklars've got them under marklar. The (super marklar) marklar's marklar \$120 and a marklar. The marklar's marklar is similar to the marklars' marklar.",
    "short text with a lot of special characters",
  );
};

