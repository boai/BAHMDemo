
import { RankData } from './RankData';
import { rankData1, rankData2 } from '../model/DataModel';

export class RankViewModel {
  loadRankDataSource1(): RankData[] {
    return rankData1;
  }

  loadRankDataSource2(): RankData[] {
    return rankData2;
  }
}
