import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/card/character.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class CharacterBondPage extends ConsumerStatefulWidget {
  final int? initialUnitId;

  const CharacterBondPage({super.key, this.initialUnitId});

  @override
  ConsumerState<CharacterBondPage> createState() => _CharacterBondPageState();
}

class _CharacterBondPageState extends ConsumerState<CharacterBondPage> {
  final SearchController _searchController = SearchController();
  String _search = '';
  late int? _unitId;

  @override
  void initState() {
    super.initState();
    _unitId = widget.initialUnitId;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.character_bond)),
      body: _unitId == null
          ? _buildPicker(t)
          : BondDetail(
              unitId: _unitId!,
              onChangeCharacter: () => setState(() => _unitId = null),
            ),
    );
  }

  Widget _buildPicker(AppLocalizations t) {
    final result = ref.watch(bondUnitSearchProvider(_search));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: SearchBar(
            controller: _searchController,
            leading: const Icon(Icons.search_rounded),
            hintText: t.search_character_bond_hint,
            onChanged: (value) => setState(() => _search = value.trim()),
            trailing: _search.isEmpty
                ? null
                : [
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _search = '');
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
          ),
        ),
        Expanded(
          child: result.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text(error.toString())),
            data: (units) {
              if (units.isEmpty) {
                return Center(child: Text(t.no_search_result));
              }
              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 390,
                  mainAxisExtent: 82,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: units.length,
                itemBuilder: (context, index) => UnitResultCard(
                  unit: units[index],
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() => _unitId = units[index].unitId);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BondDetail extends ConsumerWidget {
  final int unitId;
  final VoidCallback onChangeCharacter;

  const BondDetail({
    super.key,
    required this.unitId,
    required this.onChangeCharacter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final unit = ref.watch(unitDataProvider(unitId));
    final stories = ref.watch(characterBondStoriesProvider(unitId));
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Material(
          color: colors.surfaceContainerLow,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
            child: Row(
              children: [
                CharacterIcon(unitId: unitId, size: (64, 64)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unit.value?.unitName ?? '#$unitId',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '#$unitId',
                        style: TextStyle(color: colors.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: onChangeCharacter,
                  icon: const Icon(Icons.swap_horiz_rounded),
                  label: Text(t.change_character),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: stories.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text(error.toString())),
            data: (items) {
              if (items.isEmpty) {
                return Center(child: Text(t.no_bond_data));
              }
              return BondStoryList(stories: items);
            },
          ),
        ),
      ],
    );
  }
}

class UnitResultCard extends StatelessWidget {
  final UnitSummary unit;
  final VoidCallback onTap;

  const UnitResultCard({super.key, required this.unit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card.filled(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CharacterIcon(unitId: unit.unitId, size: (58, 58)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unit.unitName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '#${unit.unitId}',
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colors.outline),
            ],
          ),
        ),
      ),
    );
  }
}

class BondStoryList extends StatelessWidget {
  final List<CharacterBondStory> stories;

  const BondStoryList({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final groups = <int, List<CharacterBondStory>>{};
    final totals = <int, int>{};
    for (final story in stories) {
      groups.putIfAbsent(story.groupId, () => []).add(story);
      for (final bonus in story.bonuses) {
        totals.update(
          bonus.type,
          (value) => value + bonus.value,
          ifAbsent: () => bonus.value,
        );
      }
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        Card.filled(
          margin: EdgeInsets.zero,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite_rounded),
                    const SizedBox(width: 8),
                    Text(
                      t.bond_attribute_summary,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final total in totals.entries)
                      BonusChip(type: total.key, value: total.value),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        for (final group in groups.entries) ...[
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              initiallyExpanded: groups.length == 1,
              leading: CharacterIcon(
                unitId: group.key * 100 + 1,
                size: (24, 24),
              ),
              title: Text(
                groupTitle(group.value),
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Text(t.bond_story_count(group.value.length)),
              children: [
                for (final story in group.value) StoryBonusItem(story: story),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }

  String groupTitle(List<CharacterBondStory> stories) {
    final title = stories.first.title;
    final separator = title.indexOf(' 第');
    return separator > 0 ? title.substring(0, separator) : title;
  }
}

class StoryBonusItem extends StatelessWidget {
  final CharacterBondStory story;

  const StoryBonusItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.outlineVariant)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          if (story.subTitle.isNotEmpty) ...[
            const SizedBox(height: 3),
            Text(
              story.subTitle,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
            ),
          ],
          if (story.bonuses.isNotEmpty) ...[
            const SizedBox(height: 9),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                for (final bonus in story.bonuses)
                  BonusChip(type: bonus.type, value: bonus.value),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class BonusChip extends StatelessWidget {
  final int type;
  final int value;

  const BonusChip({super.key, required this.type, required this.value});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Chip(
      visualDensity: VisualDensity.compact,
      label: Text('${_attributeName(t, type)} +$value'),
    );
  }

  String _attributeName(AppLocalizations t, int type) {
    return switch (type) {
      1 => t.attr_hp,
      2 => t.attr_atk,
      3 => t.attr_def,
      4 => t.attr_magic_str,
      5 => t.attr_magic_def,
      6 => t.attr_physical_critical,
      7 => t.attr_magic_critical,
      8 => t.attr_dodge,
      9 => t.attr_life_steal,
      10 => t.attr_wave_hp_recovery,
      11 => t.attr_wave_energy_recovery,
      14 => t.attr_energy_recovery_rate,
      15 => t.attr_hp_recovery_rate,
      17 => t.attr_accuracy,
      _ => t.unknown,
    };
  }
}
